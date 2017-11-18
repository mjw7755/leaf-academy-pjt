 $( document ).ready( function() {
	        $( window ).scroll( function() {
	          if ( $( this ).scrollTop() > 200 ) {
	            $( '.scroll_top' ).fadeIn();
	            $( '.scroll_bottom' ).fadeIn();
	          } else {
	            $( '.scroll_top' ).fadeOut();
	            $( '.scroll_bottom' ).fadeOut();
	          }
	        } );
	        
	        $( '.scroll_top' ).click( function() {
	           $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
	           return false;
	        } );
	        
	        $( '.scroll_bottom' ).click( function() {
	            var bottom= $(document).height() - $(window).height();
	              $( 'html, body' ).animate( { scrollTop : bottom }, 400 );
	            return false;
	      } );
	      } );
	  