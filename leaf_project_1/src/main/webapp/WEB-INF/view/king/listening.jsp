<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<head>
<title>WebRTC Video Demo</title>
<link rel="stylesheet"
	href="node_modules/bootstrap/dist/css/bootstrap.min.css" />
</head>

<style>
body {
	background: #eee;
	padding: 5% 0;
}

video {
	background: black;
	border: 1px solid gray;
}

.call-page {
	position: relative;
	display: block;
	margin: 0 auto;
	width: 500px;
	height: 500px;
}

#localVideo {
	width: 150px;
	height: 150px;
	position: absolute;
	top: 15px;
	right: 15px;
}

#remoteVideo {
	width: 500px;
	height: 500px;
}
</style>

<body>
	<table>
		<tr>
			<td><input type="button" value="입장" onclick="aaa()" />
				<h1>코딩 영역</h1>
				<div id="chatArea">
					<div id="chatMessageArea"></div>
				</div> <textarea id="txtForm" name="txtForm"
					style="width: 600px; height: 300px; font-family: monaco;"></textarea></td>
			<td>
				<div id="loginPage" class="container text-center">

					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<button id="openServer" onclick="openServer">openServer</button>
							<h2>WebRTC Video Demo. Please sign in</h2>
							<label for="usernameInput" class="sr-only">Login</label> <input
								type="email" id="usernameInput" class="form-control formgroup"
								placeholder="Login" required="" autofocus="">
							<button id="loginBtn" class="btn btn-lg btn-primary btnblock">
								Sign in</button>

						</div>
					</div>

				</div>

				<div id="callPage" class="call-page">
					<video id="localVideo" autoplay></video>
					<video id="remoteVideo" autoplay></video>

					<div class="row text-center">
						<div class="col-md-12">
							<input id="callToUsernameInput" type="text"
								placeholder="username to call" />
							<button id="callBtn" class="btn-success btn">Call</button>
							<button id="hangUpBtn" class="btn-danger btn">Hang Up</button>
						</div>
					</div>
				</div>
			</td>
		</tr>
	</table>

	<script type="text/javascript">
		//our username
		var name;
		var connectedUser;

		//connecting to our signaling server
		var videoConn = new WebSocket(
				'wss://www.leaf-academy.com:8443/leaf_project_1/videoChat-ws.do');

		videoConn.onopen = function() {
			console.log("Connected to the signaling server");
		};

		//when we got a message from a signaling server
		videoConn.onmessage = function(msg) {
			console.log("Got message", msg.data);
			var data = JSON.parse(msg.data);

			switch (data.type) {
			case "login":
				handleLogin(data.success);
				break;
			//when somebody wants to call us
			case "offer":
				handleOffer(data.offer, data.name);
				break;
			case "answer":
				handleAnswer(data.answer);
				break;
			//when a remote peer sends an ice candidate to us
			case "candidate":
				handleCandidate(data.candidate);
				break;
			case "leave":
				handleLeave();
				break;
			default:
				break;
			}
		};

		videoConn.onerror = function(err) {
			console.log("Got error", err);
		};

		//alias for sending JSON encoded messages
		function videoSend(message) {
			//attach the other peer username to our messages
			if (connectedUser) {
				message.name = connectedUser;
			}
			videoConn.send(JSON.stringify(message));
		};

		//******
		//UI selectors block
		//******
		var localVideo = document.querySelector('#localVideo');
		var remoteVideo = document.querySelector('#remoteVideo');

		var yourConn;
		var stream;
		var loginPage = document.querySelector('#loginPage');
		var usernameInput = document.querySelector('#usernameInput');
		var loginBtn = document.querySelector('#loginBtn');

		var callPage = document.querySelector('#callPage');
		var callToUsernameInput = document
				.querySelector('#callToUsernameInput');
		var callBtn = document.querySelector('#callBtn');

		var hangUpBtn = document.querySelector('#hangUpBtn');

		//hide call page
		callPage.style.display = "none";

		// Login when the user clicks the button
		loginBtn.addEventListener("click", function(event) {
			name = usernameInput.value;

			if (name.length > 0) {
				videoSend({
					type : "login",
					name : name
				});
			}

		});

		function handleLogin(success) {

			if (success === false) {
				alert("Ooops...try a different username");
			} else {
				loginPage.style.display = "none";
				callPage.style.display = "block";

				//**********************
				//Starting a peer connection
				//**********************

				//getting local video stream
				navigator.webkitGetUserMedia({
					video : true,
					audio : true
				}, function(myStream) {
					stream = myStream;

					//displaying local video stream on the page
					localVideo.src = window.URL.createObjectURL(stream);

					//using Google public stun server
					var configuration = {
						"iceServers" : [ {
							"url" : "stun:stun2.1.google.com:19302"
						} ]
					};

					yourConn = new webkitRTCPeerConnection(configuration);

					// setup stream listening
					yourConn.addStream(stream);

					//when a remote user adds stream to the peer connection, we display it
					yourConn.onaddstream = function(e) {
						remoteVideo.src = window.URL.createObjectURL(e.stream);
					};

					// Setup ice handling
					yourConn.onicecandidate = function(event) {
						if (event.candidate) {
							videoSend({
								type : "candidate",
								candidate : event.candidate
							});
						}

					};

				}, function(error) {
					console.log(error);
				});
			}
		};

		//initiating a call
		callBtn.addEventListener("click", function() {
			var callToUsername = callToUsernameInput.value;

			if (callToUsername.length > 0) {

				connectedUser = callToUsername;

				// create an offer
				yourConn.createOffer(function(offer) {
					videoSend({
						type : "offer",
						offer : offer
					});

					yourConn.setLocalDescription(offer);

				}, function(error) {
					alert("Error when creating an offer");
				});
			}
		});

		//when somebody sends us an offer
		function handleOffer(offer, name) {
			connectedUser = name;
			yourConn.setRemoteDescription(new RTCSessionDescription(offer));

			//create an answer to an offer
			yourConn.createAnswer(function(answer) {
				yourConn.setLocalDescription(answer);

				videoSend({
					type : "answer",
					answer : answer
				});

			}, function(error) {
				alert("Error when creating an answer");
			});
		};

		//when we got an answer from a remote user
		function handleAnswer(answer) {
			yourConn.setRemoteDescription(new RTCSessionDescription(answer));
		};

		//when we got an ice candidate from a remote user
		function handleCandidate(candidate) {
			yourConn.addIceCandidate(new RTCIceCandidate(candidate));
		};

		//hang up
		hangUpBtn.addEventListener("click", function() {

			videoSend({
				type : "leave"
			});

			handleLeave();
		});

		function handleLeave() {
			connectedUser = null;
			remoteVideo.src = null;

			yourConn.close();
			yourConn.onicecandidate = null;
			yourConn.onaddstream = null;
		};
	</script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		//websocket.close();

		var txtArea = document.getElementById('txtForm');;

		var sessionid = "${sessionScope.sessionid}";
		//웹 소켓 객체를 저장할 변수를 선언
		var codingConn = new WebSocket(
				"wss://www.leaf-academy.com:8443/leaf_project_1/coding-ws.do");
		//웹 소켓 이벤트 처리
		
		$('#txtForm').keydown(
				function(event) {
					var txtValue = txtArea.value;
					var str = "";
					var selectionStart = txtArea.selectionStart;
					var keyCode = event.keyCode;
					var key = event.key;
					if(keyCode==229 || keyCode==16) return;
					else if ((keyCode >= 48 && keyCode <= 90)
							|| (keyCode >= 96 && keyCode <= 109)
							|| keyCode >= 146 || keyCode == 32) {
						str = key;
					} else {
						switch (keyCode) {
						case 13:
							str = "\\r\\n";
							break;
						case 9:
							str = "\\t";
							txtArea.value = txtValue.substring(0, selectionStart)
							+ "\t"
							+ txtValue.substring(selectionStart, txtValue.length);
							event.preventDefault();
							break;
						case 8:
							str = "back"
							break;
						}
					}
					codingSend({
						type : "coding",
						selectionStart : selectionStart,
						str : str
					});
				});

		function codingSend(message) {
			//attach the other peer username to our messages
			message.name = sessionid;
			codingConn.send(JSON.stringify(message));
		}
		codingConn.onmessage = function(msg) {
			var data = JSON.parse(msg.data);
			switch (data.type) {
			case "login":
				codingSend({
					type : "first",
					targetName : data.name,
					message : txtArea.value
				});
				break;
			//when somebody wants to call us
			case "first":
				txtArea.value = data.message;
				break;
			case "coding":
				var txt = txtArea.value;
				if(data.str=="back") {
					txtArea.value = txt.substring(0, data.selectionStart-1)
							+ txt.substring(data.selectionStart, txt.length);
				} else {
					txtArea.value = txt.substring(0, data.selectionStart)
							+ data.str
							+ txt.substring(data.selectionStart, txt.length);
					txtArea.setCaretPosition(1);
				}
				break;
			case "leave":
				break;
			default:
				break;
			}
		};
		function aaa() {
			codingSend({
				type : "login"
			});
		}
	</script>
</body>

</html>
