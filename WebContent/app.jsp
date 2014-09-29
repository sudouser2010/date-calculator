<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--HTML5 doctype-->
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


			<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ App Ui Container ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->	
			<div class="upage-content" id="mainsub" style="height:100%">
				<div class="grid grid-pad urow uib_row_3 row-height-3" data-uib="layout/row" data-ver="0" 
				style="height:100%">
					<div class="col uib_col_6 col-0_12-12" data-uib="layout/col" data-ver="0" style="height:100%">
						<div class="widget-container content-area vertical-col" style="height:100%">
					
					
						<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ For all the time elements ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
						<span id="elementContainer" data-bind="foreach: vm.timeElements" >
						
							<!-- ko if: isDateType === false -->
							<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Period Panel ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
							<div class="well no_wrap  widget uib_w_2 d-margins row" data-uib="twitter%20bootstrap/well"
							data-ver="0" style="padding-bottom: 3px ! important">
							
								<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 ">
									<span style="font-weight: bold;">Sign</span> <br>
							 
									<!-- ko if: isPositive() === true -->
										<i class="glyphicon glyphicon-plus period-icon-offset" style="color:rgb(10,160,15);
										font-size:25px; cursor:pointer;" data-bind="click: vm.toggleSign"></i>  		
									<!-- /ko -->
									<!-- ko if: isPositive() === false -->
										<i class="glyphicon glyphicon-minus period-icon-offset" style="color:rgb(230,10,15);
										 font-size:25px; cursor:pointer;" data-bind="click: vm.toggleSign"></i>			
									<!-- /ko -->									
								</div>
							
								<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 row no-padding">
									
									<div class="row no-padding" style="margin:0px">
										<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 no-padding">
											<label class="narrow-control label-top-left label-align no-padding">
												Period Start
											</label>
										</div>
										
										<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 no-padding" 
										style="text-align:right !important; height:0px;">
											<i class="glyphicon glyphicon-remove" 
											style=" color:rgb(200,10,15); top:-4px; font-size:20px; cursor:pointer"
											data-bind="click: vm.removeElement"></i>                        
										</div>                                                 									
									</div>
									

									<div class="row" style="margin:0px; padding:0px 0px 8px 0px">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" 
										style="padding:0px 8px 0px 0px">
										
											<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~ Start Date ~~~~~~~~~~~~~~~~~~~~~~~~~ -->										
											<div class="row no-padding" style="margin:0px">
												<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" 
												style="padding:0px 8px 0px 0px">
													<input class="wide-control form-control date-input" 
													type="number" placeholder="Month" data-bind="value:smonth">
												</div>
												<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" 
												style="padding:0px 8px 0px 0px">
													<input class="wide-control form-control date-input" 
													type="number" placeholder="Day" data-bind="value:sday">
												</div>
												<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" 
												style="padding:0px 8px 0px 0px">
													<input class="wide-control form-control date-input" 
													type="number" placeholder="Year" data-bind="value:syear">
												</div>
											</div>
											<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~ Start Date ~~~~~~~~~~~~~~~~~~~~~~~~~ -->											
							
											<label class="narrow-control label-top-left label-align">
												Period End
											</label>
											
											<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~ End Date ~~~~~~~~~~~~~~~~~~~~~~~~~ -->
											<div class="row no-padding" style="margin:0px">
												<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" 
												style="padding:0px 8px 0px 0px">
													<input class="wide-control form-control date-input" 
													type="number" placeholder="Month" data-bind="value:emonth">
												</div>
												<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" 
												style="padding:0px 8px 0px 0px">
													<input class="wide-control form-control date-input" 
													type="number" placeholder="Day" data-bind="value:eday">
												</div>
												<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" 
												style="padding:0px 8px 0px 0px">
													<input class="wide-control form-control date-input" 
													type="number" placeholder="Year" data-bind="value:eyear">
												</div>
											</div>
											<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~ End Date ~~~~~~~~~~~~~~~~~~~~~~~~~ -->											

										</div>
									</div>
								</div>
							
							</div>			
							<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Period Panel ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
							<!-- /ko -->
							
						</span>
						<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ For all the time elements ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
						
						
						<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Add Period Button ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
						<div class="no_wrap  widget uib_w_3 d-margins row" >
						
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 no-padding">                                             
								<button type="button" class="btn btn-default btn-sm" style="width:100%" 
								data-bind="click: vm.createPeriod">
									Add Period
								</button>
							</div>
						
						</div>
						<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Add Period Button ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
			

						</div> <!-- /widget-container content-area vertical-col -->
						<span class="uib_shim"></span>
					</div> <!-- /col uib_col_6 col-0_12-12 -->
				</div> <!-- /grid grid-pad urow uib_row_3 row-height-3 -->
			</div> <!-- /upage-content -->
			<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ App Ui Container ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
			
			
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
	<script type="application/javascript" src="static/js/app.js"></script>	
</body>
</html>