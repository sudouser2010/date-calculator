//this will contain the client side functionality of the app

//-----------------------------for extra knockout array functionality
ko.observableArray.fn.removeValueAtIndex = function(index) 
{
	this.valueWillMutate();
	this().splice(index, 1);
	this.valueHasMutated();
}	

ko.observableArray.fn.changeValueAtIndex = function(index,value) 
{
	this.valueWillMutate();
	this()[index] = value;
	this.valueHasMutated();
}		
//-----------------------------for extra knockout array functionality



//----------------------------------------------defines date element
function dateElement(days, months, years)
{
	var self 	= this;
	
	//-----------------------from user input
	self.days		= ko.observable(days);
	self.months		= ko.observable(months);
	self.years		= ko.observable(years);	
	//-----------------------from user input
	
	self.totalDays	= 0;
						
	self.isDivisibleBy = function( dividend, divisor )
	{	
		//returns true if quotient has zero remainders
		if( (dividend % divisor) === 0 )
		{
			return true;
		}
		return false;
	}
	
	self.isLeapYear = function(year)
	{
	
		/*		
		http://en.wikipedia.org/wiki/Leap_year#Algorithm
		if year is not divisible by 4 then common year
		else if year is not divisible by 100 then leap year
		else if year is divisible by 400 then leap year
		else common year
		*/
	
		if( self.isDivisisibleBy(year, 400 ) ) {
			return true;
		}else if( self.isDivisisibleBy(year, 100) ) {
			return false;				
		}else if( self.isDivisisibleBy(year, 4) ) {
			return true;
		}else {
			return false
		}
			
	}
	
	self.findDaysInMonths = function( year, month )
	{
		daysInMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
		
		//since months start with 0, -- shifts the index to compensate
		month--;
		
		if( month===1 && self.isLeapYear(year) ) 
		{
			//+1 because this represents the extra day in a February
			//note in this situation, 29 should be returned
			return daysInMonths[month]+1;
		}
		
		return daysInMonths[month];
	
	}
	
	self.doLastDayOfMonthCorrection = function()
	{
		//this is for rule 3, if the current day is the last day of the month, change it to 30
		
		if( self.months === 2 )
		{
			if( self.isLeapYear(year) ) {
			
				if(self.days() === 29)
				{
					self.days(30);
				}
			}else{
				
				if(self.days() === 28)
				{
					self.days(30);
				}
			}
			
		}else{
			numberOfDaysInMonth = self.findDaysInMonths(self.years, self.months);
			if( self.days() === numberOfDaysInMonth ) {
				self.days(30);
			}
			
		}
		
	}
	
	self.isNull	= function(value)
	{
		 if(typeof value === 'undefined'){
		   return true
		 };			
		 return false;
	}

	self.makeInputZeroIfNull = function()
	{
		if( self.isNull(self.years()) ){
			self.years(0);
		}
		if( self.isNull(self.months()) ){
			self.months(0);
		}
		if( self.isNull(self.days()) ){
			self.days(0);
		}
	
	}
	
	
	self.preformatSelf = function()
	{
		//applies rule 3 fix
	
	}

	self.convertToDays = function()
	{
		self.makeInputZeroIfNull();
		self.doLastDayOfMonthCorrection();
		
		//the +1 at the end is to make it inclusive
		self.totalDays	=  parseInt(self.years()*360) + parseInt(self.months()*30) + parseInt(self.days()) + 1; 
	}			

}
//----------------------------------------------defines date element

//-------------------------------------------------------------------defines period element
function periodElement(uniqueId)
{
	var self 	= this;
	
    //s isfor start, e is for end
    self.sday       = '';
    self.smonth     = '';
    self.syear      = '';

    self.eday       = '';
    self.emonth     = '';
    self.eyear      = '';	
    
	//uid means unique id
	self.uid		= uniqueId;
	
	self.isPositive	= ko.observable(true);	

    self.convertToDays = function() 
    {
        //get total days for start
        var startDate = new dateElement(self.sday, self.smonth, self.syear);       
        startDate.convertToDays();

        //get total days for end
        var endDate = new dateElement(self.eday, self.emonth, self.eyear);
        endDate.convertToDays();

        self.totalDays = endDate.totalDays - startDate.totalDays;

    }		
}
//-------------------------------------------------------------------defines period element

//----------------------------------------------defines main logic of app element
function mainLogic(appParent)
{
	var self	= this;
	
	self.getTotalDays = function()
	{
		var sum = 0;
		for(i=0; i< appParent.timeElements().length; i++)
		{
			appParent.timeElements()[i].convertToDays();
			sum = sum + appParent.timeElements()[i].totalDays;
		}
		return sum;
		
	}
	
	self.getQuotientAndRemainder = function( dividend, divisor )
	{
		//returns quotient and remainder in an array
		quotient	= Math.floor(dividend/divisor);				
		remainder 	= dividend % divisor;
		
		return [quotient, remainder];
	}			
	
	self.convertTotalTimeToDate = function( totalDays )
	{
		//returns time as an array of [years,months,days]
		quotientRemainder = self.getQuotientAndRemainder( totalDays, 360 );
		years			= quotientRemainder[0];
		remainingDays	= quotientRemainder[1];
		
		quotientRemainder = self.getQuotientAndRemainder( remainingDays, 30 );
		months			= quotientRemainder[0];
		remainingDays	= quotientRemainder[1];		

		return [years, months, remainingDays];
	
	
	}
	
	self.calculate = function()
	{
	
		try
		{
			var totalDays 		= self.getTotalDays();
			var yearsMonthsDays	= self.convertTotalTimeToDate(totalDays);
			alert(yearsMonthsDays);
		}
		catch(err)
		{
			alert('Error');
		}

	}			

}
//----------------------------------------------defines main logic of app element



//----------------------------------defines app element
function app() 
{
	var self				= this;
	self.timeElements		= ko.observableArray([]);
	logic 					= new mainLogic(self);			

	
	//this is what I use to give each element a unique id
	self.uniqueItemCount	= 0;
	
	self.createDate = function()
	{
		//adds a date element to the bottom of the element container
		self.timeElements.push( new dateElement(self.uniqueItemCount) );
		self.uniqueItemCount++;
	}
	
	self.createPeriod = function()
	{
		//adds a date element to the bottom of the element container
		self.timeElements.push( new periodElement(self.uniqueItemCount) );
		self.uniqueItemCount++;
	}	

	self.clear = function()
	{
		self.timeElements([]);
	}
	
	self.removeElement = function(element)
	{

		for(i=0; i<self.timeElements().length; i++) 
		{
			if( element["uid"] === self.timeElements()[i]["uid"])
			{
				self.timeElements.removeValueAtIndex(i);
				return true;
			}
		}
		return false;
	}
	
	self.toggleSign = function(element)
	{
		element.isPositive( !element.isPositive() );
	}	

	self.calculate = function()
	{

		logic.calculate();
	
	}	
	
}
//----------------------------------defines app element

//------------------------creates an instance of the app called vm and applies bindings to it
var vm = new app();
ko.applyBindings(vm);
//------------------------creates an instance of the app called vm and applies bindings to it