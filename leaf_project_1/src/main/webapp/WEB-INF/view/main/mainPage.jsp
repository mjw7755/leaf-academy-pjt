<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
   <title>main</title>
</head>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <!--  <link rel="stylesheet" href="resources/swiper.min.css"> -->
<style type="text/css">
   *, *:before, *:after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}
   /*swiper  */
    #swiper{
       width:1500px;
       height: 100%;
       z-index: 1;
    }
    .swiper-container {
        width: 1500px;
        height: 100%;
        
    }
    .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #e5d335;
        
        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
    }
    
    /* min.css */
    
    /**
 * Swiper 3.4.2
 * Most modern mobile touch slider and framework with hardware accelerated transitions
 * 
 * http://www.idangero.us/swiper/
 * 
 * Copyright 2017, Vladimir Kharlampidi
 * The iDangero.us
 * http://www.idangero.us/
 * 
 * Licensed under MIT
 * 
 * Released on: March 10, 2017
 */
.swiper-container {
   margin-left: auto;
   margin-right: auto;
   position: relative;
   overflow: hidden;
   z-index: 1
}

.swiper-container-no-flexbox .swiper-slide {
   float: left
}

.swiper-container-vertical>.swiper-wrapper {
   -webkit-box-orient: vertical;
   -moz-box-orient: vertical;
   -ms-flex-direction: column;
   -webkit-flex-direction: column;
   flex-direction: column
}

.swiper-wrapper {
   position: relative;
   width: 100%;
   height: 100%;
   z-index: 1;
   display: -webkit-box;
   display: -moz-box;
   display: -ms-flexbox;
   display: -webkit-flex;
   display: flex;
   -webkit-transition-property: -webkit-transform;
   -moz-transition-property: -moz-transform;
   -o-transition-property: -o-transform;
   -ms-transition-property: -ms-transform;
   transition-property: transform;
   -webkit-box-sizing: content-box;
   -moz-box-sizing: content-box;
   box-sizing: content-box
}

.swiper-container-android .swiper-slide, .swiper-wrapper {
   -webkit-transform: translate3d(0, 0, 0);
   -moz-transform: translate3d(0, 0, 0);
   -o-transform: translate(0, 0);
   -ms-transform: translate3d(0, 0, 0);
   transform: translate3d(0, 0, 0)
}

.swiper-container-multirow>.swiper-wrapper {
   -webkit-box-lines: multiple;
   -moz-box-lines: multiple;
   -ms-flex-wrap: wrap;
   -webkit-flex-wrap: wrap;
   flex-wrap: wrap
}

.swiper-container-free-mode>.swiper-wrapper {
   -webkit-transition-timing-function: ease-out;
   -moz-transition-timing-function: ease-out;
   -ms-transition-timing-function: ease-out;
   -o-transition-timing-function: ease-out;
   transition-timing-function: ease-out;
   margin: 0 auto
}

.swiper-slide {
   -webkit-flex-shrink: 0;
   -ms-flex: 0 0 auto;
   flex-shrink: 0;
   width: 100%;
   height: 100%;
   position: relative
}

.swiper-container-autoheight, .swiper-container-autoheight .swiper-slide
   {
   height: auto
}

.swiper-container-autoheight .swiper-wrapper {
   -webkit-box-align: start;
   -ms-flex-align: start;
   -webkit-align-items: flex-start;
   align-items: flex-start;
   -webkit-transition-property: -webkit-transform, height;
   -moz-transition-property: -moz-transform;
   -o-transition-property: -o-transform;
   -ms-transition-property: -ms-transform;
   transition-property: transform, height
}

.swiper-container .swiper-notification {
   position: absolute;
   left: 0;
   top: 0;
   pointer-events: none;
   opacity: 0;
   z-index: -1000
}

.swiper-wp8-horizontal {
   -ms-touch-action: pan-y;
   touch-action: pan-y
}

.swiper-wp8-vertical {
   -ms-touch-action: pan-x;
   touch-action: pan-x
}

.swiper-button-next, .swiper-button-prev {
   position: absolute;
   top: 50%;
   width: 27px;
   height: 44px;
   margin-top: -22px;
   z-index: 10;
   cursor: pointer;
   -moz-background-size: 27px 44px;
   -webkit-background-size: 27px 44px;
   background-size: 27px 44px;
   background-position: center;
   background-repeat: no-repeat
}

.swiper-button-next.swiper-button-disabled, .swiper-button-prev.swiper-button-disabled
   {
   opacity: .35;
   cursor: auto;
   pointer-events: none
}

.swiper-button-prev, .swiper-container-rtl .swiper-button-next {
   background-image:
      url("resources/btn_left2.png");
   left: 200px;
   right: auto
}

.swiper-button-prev.swiper-button-black, .swiper-container-rtl .swiper-button-next.swiper-button-black
   {
   background-image:
      url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M0%2C22L22%2C0l2.1%2C2.1L4.2%2C22l19.9%2C19.9L22%2C44L0%2C22L0%2C22L0%2C22z'%20fill%3D'%23000000'%2F%3E%3C%2Fsvg%3E")
}

.swiper-button-prev.swiper-button-white, .swiper-container-rtl .swiper-button-next.swiper-button-white
   {
   background-image:
      url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M0%2C22L22%2C0l2.1%2C2.1L4.2%2C22l19.9%2C19.9L22%2C44L0%2C22L0%2C22L0%2C22z'%20fill%3D'%23ffffff'%2F%3E%3C%2Fsvg%3E")
}

.swiper-button-next, .swiper-container-rtl .swiper-button-prev {
   background-image:
      url("resources/btn_right2.png");
   right: 200px;
   left: auto
}

.swiper-button-next.swiper-button-black, .swiper-container-rtl .swiper-button-prev.swiper-button-black
   {
   background-image:
      url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M27%2C22L27%2C22L5%2C44l-2.1-2.1L22.8%2C22L2.9%2C2.1L5%2C0L27%2C22L27%2C22z'%20fill%3D'%23000000'%2F%3E%3C%2Fsvg%3E")
}

.swiper-button-next.swiper-button-white, .swiper-container-rtl .swiper-button-prev.swiper-button-white
   {
   background-image:
      url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M27%2C22L27%2C22L5%2C44l-2.1-2.1L22.8%2C22L2.9%2C2.1L5%2C0L27%2C22L27%2C22z'%20fill%3D'%23ffffff'%2F%3E%3C%2Fsvg%3E")
}

.swiper-pagination {
    position: absolute;
    text-align: center;
    -webkit-transition: .3s;
    -moz-transition: .3s;
    -o-transition: .3s;
    transition: .3s;
    -webkit-transform: translate3d(0, 0, 0);
    -ms-transform: translate3d(0, 0, 0);
    -o-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0);
    z-index: 10;
}

.swiper-pagination.swiper-pagination-hidden {
   opacity: 0
}

.swiper-container-horizontal>.swiper-pagination-bullets,
   .swiper-pagination-custom, .swiper-pagination-fraction {
   top: 10px;
   left: 0;
   width: 100%
}

.swiper-pagination-bullet {
   width: 8px;
   height: 8px;
   display: inline-block;
   border-radius: 100%;
   background: #000;
   opacity: .2
}

button.swiper-pagination-bullet {
   border: none;
   margin: 0;
   padding: 0;
   box-shadow: none;
   -moz-appearance: none;
   -ms-appearance: none;
   -webkit-appearance: none;
   appearance: none
}

.swiper-pagination-clickable .swiper-pagination-bullet {
   cursor: pointer
}

.swiper-pagination-white .swiper-pagination-bullet {
   background: #fff
}

.swiper-pagination-bullet-active {
   opacity: 1;
   background: #439560
}

.swiper-pagination-white .swiper-pagination-bullet-active {
   background: #fff
}

.swiper-pagination-black .swiper-pagination-bullet-active {
   background: #000
}

.swiper-container-vertical>.swiper-pagination-bullets {
   right: 10px;
   top: 50%;
   -webkit-transform: translate3d(0, -50%, 0);
   -moz-transform: translate3d(0, -50%, 0);
   -o-transform: translate(0, -50%);
   -ms-transform: translate3d(0, -50%, 0);
   transform: translate3d(0, -50%, 0)
}

.swiper-container-vertical>.swiper-pagination-bullets .swiper-pagination-bullet
   {
   margin: 5px 0;
   display: block
}

.swiper-container-horizontal>.swiper-pagination-bullets .swiper-pagination-bullet
   {
   margin: 0 5px
}

.swiper-pagination-progress {
   background: rgba(0, 0, 0, .25);
   position: absolute
}

.swiper-pagination-progress .swiper-pagination-progressbar {
   background: #007aff;
   position: absolute;
   left: 0;
   top: 0;
   width: 100%;
   height: 100%;
   -webkit-transform: scale(0);
   -ms-transform: scale(0);
   -o-transform: scale(0);
   transform: scale(0);
   -webkit-transform-origin: left top;
   -moz-transform-origin: left top;
   -ms-transform-origin: left top;
   -o-transform-origin: left top;
   transform-origin: left top
}

.swiper-container-rtl .swiper-pagination-progress .swiper-pagination-progressbar
   {
   -webkit-transform-origin: right top;
   -moz-transform-origin: right top;
   -ms-transform-origin: right top;
   -o-transform-origin: right top;
   transform-origin: right top
}

.swiper-container-horizontal>.swiper-pagination-progress {
   width: 100%;
   height: 4px;
   left: 0;
   top: 0
}

.swiper-container-vertical>.swiper-pagination-progress {
   width: 4px;
   height: 100%;
   left: 0;
   top: 0
}

.swiper-pagination-progress.swiper-pagination-white {
   background: rgba(255, 255, 255, .5)
}

.swiper-pagination-progress.swiper-pagination-white .swiper-pagination-progressbar
   {
   background: #fff
}

.swiper-pagination-progress.swiper-pagination-black .swiper-pagination-progressbar
   {
   background: #000
}

.swiper-container-3d {
   -webkit-perspective: 1200px;
   -moz-perspective: 1200px;
   -o-perspective: 1200px;
   perspective: 1200px
}

.swiper-container-3d .swiper-cube-shadow, .swiper-container-3d .swiper-slide,
   .swiper-container-3d .swiper-slide-shadow-bottom, .swiper-container-3d .swiper-slide-shadow-left,
   .swiper-container-3d .swiper-slide-shadow-right, .swiper-container-3d .swiper-slide-shadow-top,
   .swiper-container-3d .swiper-wrapper {
   -webkit-transform-style: preserve-3d;
   -moz-transform-style: preserve-3d;
   -ms-transform-style: preserve-3d;
   transform-style: preserve-3d
}

.swiper-container-3d .swiper-slide-shadow-bottom, .swiper-container-3d .swiper-slide-shadow-left,
   .swiper-container-3d .swiper-slide-shadow-right, .swiper-container-3d .swiper-slide-shadow-top
   {
   position: absolute;
   left: 0;
   top: 0;
   width: 100%;
   height: 100%;
   pointer-events: none;
   z-index: 10
}

.swiper-container-3d .swiper-slide-shadow-left {
   background-image: -webkit-gradient(linear, left top, right top, from(rgba(0, 0, 0, .5)),
      to(rgba(0, 0, 0, 0)));
   background-image: -webkit-linear-gradient(right, rgba(0, 0, 0, .5),
      rgba(0, 0, 0, 0));
   background-image: -moz-linear-gradient(right, rgba(0, 0, 0, .5),
      rgba(0, 0, 0, 0));
   background-image: -o-linear-gradient(right, rgba(0, 0, 0, .5),
      rgba(0, 0, 0, 0));
   background-image: linear-gradient(to left, rgba(0, 0, 0, .5),
      rgba(0, 0, 0, 0))
}

.swiper-container-3d .swiper-slide-shadow-right {
   background-image: -webkit-gradient(linear, right top, left top, from(rgba(0, 0, 0, .5)),
      to(rgba(0, 0, 0, 0)));
   background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, .5),
      rgba(0, 0, 0, 0));
   background-image: -moz-linear-gradient(left, rgba(0, 0, 0, .5),
      rgba(0, 0, 0, 0));
   background-image: -o-linear-gradient(left, rgba(0, 0, 0, .5),
      rgba(0, 0, 0, 0));
   background-image: linear-gradient(to right, rgba(0, 0, 0, .5),
      rgba(0, 0, 0, 0))
}

.swiper-container-3d .swiper-slide-shadow-top {
   background-image: -webkit-gradient(linear, left top, left bottom, from(rgba(0, 0, 0, .5)),
      to(rgba(0, 0, 0, 0)));
   background-image: -webkit-linear-gradient(bottom, rgba(0, 0, 0, .5),
      rgba(0, 0, 0, 0));
   background-image: -moz-linear-gradient(bottom, rgba(0, 0, 0, .5),
      rgba(0, 0, 0, 0));
   background-image: -o-linear-gradient(bottom, rgba(0, 0, 0, .5),
      rgba(0, 0, 0, 0));
   background-image: linear-gradient(to top, rgba(0, 0, 0, .5),
      rgba(0, 0, 0, 0))
}

.swiper-container-3d .swiper-slide-shadow-bottom {
   background-image: -webkit-gradient(linear, left bottom, left top, from(rgba(0, 0, 0, .5)),
      to(rgba(0, 0, 0, 0)));
   background-image: -webkit-linear-gradient(top, rgba(0, 0, 0, .5),
      rgba(0, 0, 0, 0));
   background-image: -moz-linear-gradient(top, rgba(0, 0, 0, .5),
      rgba(0, 0, 0, 0));
   background-image: -o-linear-gradient(top, rgba(0, 0, 0, .5),
      rgba(0, 0, 0, 0));
   background-image: linear-gradient(to bottom, rgba(0, 0, 0, .5),
      rgba(0, 0, 0, 0))
}

.swiper-container-coverflow .swiper-wrapper, .swiper-container-flip .swiper-wrapper
   {
   -ms-perspective: 1200px
}

.swiper-container-cube, .swiper-container-flip {
   overflow: visible
}

.swiper-container-cube .swiper-slide, .swiper-container-flip .swiper-slide
   {
   pointer-events: none;
   -webkit-backface-visibility: hidden;
   -moz-backface-visibility: hidden;
   -ms-backface-visibility: hidden;
   backface-visibility: hidden;
   z-index: 1
}

.swiper-container-cube .swiper-slide .swiper-slide,
   .swiper-container-flip .swiper-slide .swiper-slide {
   pointer-events: none
}

.swiper-container-cube .swiper-slide-active, .swiper-container-cube .swiper-slide-active .swiper-slide-active,
   .swiper-container-flip .swiper-slide-active, .swiper-container-flip .swiper-slide-active .swiper-slide-active
   {
   pointer-events: auto
}

.swiper-container-cube .swiper-slide-shadow-bottom,
   .swiper-container-cube .swiper-slide-shadow-left,
   .swiper-container-cube .swiper-slide-shadow-right,
   .swiper-container-cube .swiper-slide-shadow-top, .swiper-container-flip .swiper-slide-shadow-bottom,
   .swiper-container-flip .swiper-slide-shadow-left,
   .swiper-container-flip .swiper-slide-shadow-right,
   .swiper-container-flip .swiper-slide-shadow-top {
   z-index: 0;
   -webkit-backface-visibility: hidden;
   -moz-backface-visibility: hidden;
   -ms-backface-visibility: hidden;
   backface-visibility: hidden
}

.swiper-container-cube .swiper-slide {
   visibility: hidden;
   -webkit-transform-origin: 0 0;
   -moz-transform-origin: 0 0;
   -ms-transform-origin: 0 0;
   transform-origin: 0 0;
   width: 100%;
   height: 100%
}

.swiper-container-cube.swiper-container-rtl .swiper-slide {
   -webkit-transform-origin: 100% 0;
   -moz-transform-origin: 100% 0;
   -ms-transform-origin: 100% 0;
   transform-origin: 100% 0
}

.swiper-container-cube .swiper-slide-active, .swiper-container-cube .swiper-slide-next,
   .swiper-container-cube .swiper-slide-next+.swiper-slide,
   .swiper-container-cube .swiper-slide-prev {
   pointer-events: auto;
   visibility: visible
}

.swiper-container-cube .swiper-cube-shadow {
   position: absolute;
   left: 0;
   bottom: 0;
   width: 100%;
   height: 100%;
   background: #000;
   opacity: .6;
   -webkit-filter: blur(50px);
   filter: blur(50px);
   z-index: 0
}

.swiper-container-fade.swiper-container-free-mode .swiper-slide {
   -webkit-transition-timing-function: ease-out;
   -moz-transition-timing-function: ease-out;
   -ms-transition-timing-function: ease-out;
   -o-transition-timing-function: ease-out;
   transition-timing-function: ease-out
}

.swiper-container-fade .swiper-slide {
   pointer-events: none;
   -webkit-transition-property: opacity;
   -moz-transition-property: opacity;
   -o-transition-property: opacity;
   transition-property: opacity
}

.swiper-container-fade .swiper-slide .swiper-slide {
   pointer-events: none
}

.swiper-container-fade .swiper-slide-active, .swiper-container-fade .swiper-slide-active .swiper-slide-active
   {
   pointer-events: auto
}

.swiper-zoom-container {
   width: 100%;
   height: 100%;
   display: -webkit-box;
   display: -moz-box;
   display: -ms-flexbox;
   display: -webkit-flex;
   display: flex;
   -webkit-box-pack: center;
   -moz-box-pack: center;
   -ms-flex-pack: center;
   -webkit-justify-content: center;
   justify-content: center;
   -webkit-box-align: center;
   -moz-box-align: center;
   -ms-flex-align: center;
   -webkit-align-items: center;
   align-items: center;
   text-align: center
}

.swiper-zoom-container>canvas, .swiper-zoom-container>img,
   .swiper-zoom-container>svg {
   max-width: 100%;
   max-height: 100%;
   object-fit: contain
}

.swiper-scrollbar {
   border-radius: 10px;
   position: relative;
   -ms-touch-action: none;
   background: rgba(0, 0, 0, .1)
}

.swiper-container-horizontal>.swiper-scrollbar {
   position: absolute;
   left: 1%;
   bottom: 3px;
   z-index: 50;
   height: 5px;
   width: 98%
}

.swiper-container-vertical>.swiper-scrollbar {
   position: absolute;
   right: 3px;
   top: 1%;
   z-index: 50;
   width: 5px;
   height: 98%
}

.swiper-scrollbar-drag {
   height: 100%;
   width: 100%;
   position: relative;
   background: rgba(0, 0, 0, .5);
   border-radius: 10px;
   left: 0;
   top: 0
}

.swiper-scrollbar-cursor-drag {
   cursor: move
}

.swiper-lazy-preloader {
   width: 42px;
   height: 42px;
   position: absolute;
   left: 50%;
   top: 50%;
   margin-left: -21px;
   margin-top: -21px;
   z-index: 10;
   -webkit-transform-origin: 50%;
   -moz-transform-origin: 50%;
   transform-origin: 50%;
   -webkit-animation: swiper-preloader-spin 1s steps(12, end) infinite;
   -moz-animation: swiper-preloader-spin 1s steps(12, end) infinite;
   animation: swiper-preloader-spin 1s steps(12, end) infinite
}

.swiper-lazy-preloader:after {
   display: block;
   content: "";
   width: 100%;
   height: 100%;
   background-image:
      url("data:image/svg+xml;charset=utf-8,%3Csvg%20viewBox%3D'0%200%20120%20120'%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20xmlns%3Axlink%3D'http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink'%3E%3Cdefs%3E%3Cline%20id%3D'l'%20x1%3D'60'%20x2%3D'60'%20y1%3D'7'%20y2%3D'27'%20stroke%3D'%236c6c6c'%20stroke-width%3D'11'%20stroke-linecap%3D'round'%2F%3E%3C%2Fdefs%3E%3Cg%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(30%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(60%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(90%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(120%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(150%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.37'%20transform%3D'rotate(180%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.46'%20transform%3D'rotate(210%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.56'%20transform%3D'rotate(240%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.66'%20transform%3D'rotate(270%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.75'%20transform%3D'rotate(300%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.85'%20transform%3D'rotate(330%2060%2C60)'%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E");
   background-position: 50%;
   -webkit-background-size: 100%;
   background-size: 100%;
   background-repeat: no-repeat
}

.swiper-lazy-preloader-white:after {
   background-image:
      url("data:image/svg+xml;charset=utf-8,%3Csvg%20viewBox%3D'0%200%20120%20120'%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20xmlns%3Axlink%3D'http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink'%3E%3Cdefs%3E%3Cline%20id%3D'l'%20x1%3D'60'%20x2%3D'60'%20y1%3D'7'%20y2%3D'27'%20stroke%3D'%23fff'%20stroke-width%3D'11'%20stroke-linecap%3D'round'%2F%3E%3C%2Fdefs%3E%3Cg%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(30%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(60%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(90%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(120%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(150%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.37'%20transform%3D'rotate(180%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.46'%20transform%3D'rotate(210%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.56'%20transform%3D'rotate(240%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.66'%20transform%3D'rotate(270%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.75'%20transform%3D'rotate(300%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.85'%20transform%3D'rotate(330%2060%2C60)'%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E")
}

@
-webkit-keyframes swiper-preloader-spin { 100%{
   -webkit-transform: rotate(360deg)
}

}
@
keyframes swiper-preloader-spin { 100%{
   transform: rotate(360deg)
}
}
/* swiper end*/

/* #another_menu{
   width:800px;
   margin-top:30px;
   text-align: center;
   border-spacing: 0px;
}
#another_menu td{
   border-right: 1px solid;
   border-right-color: gray;
   width:100px;
} */

#width_wrap{
   width:900px;
   margin: auto;
}

#notice, #curri, #advice{
   width:300px;
   height:120px;
   float:left;
}
#notice p, #curri p, #advice p{
   text-align: left;
   padding-left: 15px;
   padding-top: 10px;
   color: #fff;
   font-weight: bold;
}
#box_img{
   border-bottom: 1px solid;
   border-bottom-color: #fff;
   margin-top: 10px;
   width: 200px;
}
#notice{
   background-color: #8dcf4d;
}
#curri{
   background-color: #68aa75;
}
#advice{
   background-color: #439560;
}
/*  */
#lecture, #play, #book, #QnA{
   width:225px;
   height: 150px;
   float:left;
   overflow:hidden;
}
#teacher_introduce, #academy{
   width:450px;
   height: 80px;
   float:left;
   margin-top: 30px;
}
/*  */

/*    #quick_banner{
      position: fixed;
      top:20%;
      right: 2%;
      width:75px;
      z-index: 2;
   }
   #quick_banner a{
      text-decoration: none;
      color: #000;
   }
   #quick{
      background-color: #2b6728;
      color:#fff;
      height: 60px;
      text-align: center;
   }
   #quick p{
      padding-top: 10px;
   }
   #quick_myclass, #quick_mypage, #quick_book, #quick_curri{
      border: 1px solid;
      border-color: #9c9e9c;
      height: 60px;
      text-align: center;
      font-size: 12px;
      font-weight: bold;
      background-color: #fff;
   }
   #quick_myclass p, #quick_mypage p, #quick_book p, #quick_curri p{
      margin: auto;
      padding-top: 5px;
      padding-bottom: 5px;
   }
   #quick_myclass img, #quick_mypage img, #quick_book img, #quick_curri img{
      width:30px;
      height: 30px;
   }
   #quick_top{
      background-color: #2b6728;
      color:#fff;
      height: 45px;
      text-align: center;
   }
   #quick_top p{
      margin: auto;
   }
   #quick_top img{
      width:20px;
      height: 13px;
   }
 */</style>
<body>
    
    <!-- Swiper -->
    <div id="swiper">
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">            
              <img src="resources/ram/main_banner.png" alt="sample83" />
                <a href="#"></a>
         </div>
               
            <div class="swiper-slide">
              <img src="resources/ram/main_banner2.png" alt="sample83" />
                <a href="#"></a>
         </div>
            
            <div class="swiper-slide">
              <img src="resources/ram/main_banner3.png" alt="sample83" />
                <a href="#"></a>
            </div>
            
            <div class="swiper-slide">
              <img src="resources/ram/main_banner4.png" alt="sample83" />
                <a href="#"></a>
            </div>
        <!--     
            <div class="swiper-slide">
              <img src="resources/carousel_story5.png" alt="sample83" />
                <a href="#"></a>
            </div> -->

        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
        <!-- Add Arrows -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
   </div>
   <!-- swiper end -->

    <!-- Swiper JS -->
    <script src="resources/swiper.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        slidesPerView: 1,
        paginationClickable: true,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: 5000,
        autoplayDisableOnInteraction: false,
        loop: true
    });
    </script>
    <!-- swiper script end -->
    
    
    
    
    <!-- another menu -->
    <!-- <div>
    <table id="another_menu">
       <tr>
          <td><img src="resources/board3.png"/></td>
          <td><img src="resources/call2.png"/></td>
          <td><img src="resources/curriculum3.png"/></td>
          <td><img src="resources/payment2.png"/></td>
       </tr>
       <tr>
          <td>공지사항</td>
          <td>상담문의</td>
          <td>커리큘럼</td>
          <td>온라인결제</td>
       </tr>
    </table>
    </div> -->
    <!-- another menu end -->
    
    <!-- main center menu -->
    <div id="main_box">
       <div id="width_wrap">
       
          <a href="notice_list.do">
          <div id="notice">
             <p>리프코딩 소식</p>
             <div id="box_img">
             <img src="resources/ram/board3.png" />
             </div>
          </div>
          </a>
          
          <a href="list_curri.do">
          <div id="curri">
             <p>교육과정</p>
             <div id="box_img">
                <img src="resources/ram/curriculum3.png"/>
             </div>
          </div>
          </a>
          
          <a href="#"><!-- 쪽지보내기 페이지로 이동 -->
          <div id="advice">
             <p>입회상담</p>
             <div id="box_img">
                <img src="resources/ram/call2.png"/>
             </div>
          </div>
          </a>
          
       </div>
    </div>
    
    <div id="main_box2">
       <div id="width_wrap">
       
          <a href="listening.do"><!-- 강의 듣기 페이지로 이동 -->
          <div id="lecture">
             <img src="resources/ram/main_lecture4.png"/>
          </div>
          </a>
          
          <a href="book_list.do">
          <div id="book">
             <img src="resources/ram/main_book3.png"/>
          </div>
         </a>
         
         <a href="fiveinarow.do">
          <div id="play">
             <img src="resources/ram/main_play4.png"/>
          </div>
          </a>
          
          <a href="qna_list.do">
          <div id="QnA">
             <img src="resources/ram/main_qna3.png"/>
          </div>
          </a>
       </div>
    </div>
    
    <div id="main_box3">
       <div id="width_wrap">
          <a href="t_intro_list.do">
          <div id="teacher_introduce">
             <img src="resources/ram/main_teacher5.png">
          </div>
          </a>
          
          <a href="academy.do">
          <div id="academy">
             <img src="resources/ram/main_academy4.png">
          </div>
          </a>
       </div>
    </div>
    <!-- main center menu end -->
    
    <!-- quick menu -->
   <!--  <div id="quick_banner">
   <div id="quick">
      <p>QUICK MENU</p>
   </div>
   <a href="myclass.do">
   <div id="quick_myclass">
      <p>내 강의실</p>
      <img src="resources/ram/lecture2.png">
   </div>
   </a>
   
   <a href="mypage.do">
   <div id="quick_mypage">
      <p>마이페이지</p>
      <img src="resources/ram/mypage.png">
   </div>
   </a>
   
   <a href="book_list.do">
   <div id="quick_book">
      <p>도서</p>
      <img src="resources/ram/book3.png">
   </div>
   </a>
   
   <a href="list_curri.do">
   <div id="quick_curri">
      <p>커리큘럼</p>
      <img src="resources/ram/curriculum3.png">
   </div>
   </a>
   
   <a href="#">
   <div id="quick_top">
      <img src="resources/ram/scroll.png">
      <p>TOP</p>
   </div>
   </a>
   
</div>
<script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
<script src="resources/scroll.js"></script>
<script>
   $(function() {
      $("#quick_top").click(function() {
         $('html,body').animate({
            scrollTop : 0
         }, 400);
         return false;
      });
   });
</script> -->
    <!-- quick menu end -->
</body>
</html>