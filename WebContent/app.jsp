<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Date Calculator</title>
	<link rel="stylesheet" type="text/css" href="static/slate/css/slate.min.css" class="uib-framework-theme">
	<link rel="stylesheet" type="text/css" href="static/css/index_main.less.css" class="main-less">
	<title>Military Date Calculator</title>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, 
	user-scalable=0">

	<script type="application/javascript" src="static/js/jquery.min.js"></script>
	<script type="application/javascript" src="static/marginal/marginal-position.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="static/css/custom-styles.css" />
	<script type="application/javascript" src="static/js/knockout.js"></script>		
</head>
<body>
	<div class="uwrap" >
		<div class="upage" id="mainpage">
			<div class="upage-outer">
			<!-- ~~~~~~~~~~~~~~~~~~~ HEADER ~~~~~~~~~~~~~~~~~~~ -->
			<div class="uib-header header-bg container-group inner-element uib_w_1 uib-header-fixed" 
			data-uib="layout/header" data-ver="0" style="background-color: rgb(200, 200, 200); 
			min-height: 35px ! important">
		
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 no-padding">
					<div style="font-weight:900 ; text-align:center; font-size:21px; color:rgb(30,30,30)">Date Calculator
					</div>
				</div>
		
			</div>
			<!-- ~~~~~~~~~~~~~~~~~~~ HEADER ~~~~~~~~~~~~~~~~~~~ -->
	

			<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ For all the time elements ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
			
				<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Period Panel ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
			
				<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Period Panel ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
			
			<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ For all the time elements ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
			
			
			<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Add Period Button ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
			
			<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Add Period Button ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
			
			<!-- used for keeping the buttons visible -->
			<div style="margin-top:25%"></div>
			
			<!-- ~~~~~~~~~~~~~~~~~~~ FOOTER ~~~~~~~~~~~~~~~~~~~ -->
			<div class="uib-footer uib-footer-fixed footer-bg container-group inner-element uib_w_7" 
			data-uib="layout/footer" data-ver="0" style="min-height:20px !important">

				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 no-padding">
					<button type="button" class="btn-lg btn-block no-curve calculate-btn button-height" 
					data-bind="click: vm.calculate">
						<i class="glyphicon glyphicon-play button-icon-center" style="left:-20px; color: white"></i>
						<span style="font-weight:900" class="dark-gray">Calculate</span>
					</button>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 no-padding">
					<button type="button" class="btn-lg btn-block no-curve clear-btn button-height" 
					data-bind="click: vm.clear">
						<i class="glyphicon glyphicon-refresh button-icon-center" style="left:-2px; color: white"></i>
						<span style="font-weight:900" class="dark-gray">Clear</span>
					</button>
				</div>

			</div>
			<!-- ~~~~~~~~~~~~~~~~~~~ FOOTER ~~~~~~~~~~~~~~~~~~~ -->
			
			
			</div> <!-- /upage-outer -->
		</div> <!-- /upage -->
	</div> <!-- /uwrap -->	
	
</body>
</html>