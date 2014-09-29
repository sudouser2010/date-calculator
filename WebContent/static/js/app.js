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
function dateElement(uniqueId)
{
	var self 	= this;
	
	//-----------------------from user input
	self.years		= ko.observable();
	self.months		= ko.observable();
	self.days		= ko.observable();
	self.isPositive	= ko.observable(true);		
	//-----------------------from user input
	
	//uid means unique id			
	self.uid		= uniqueId;
	self.isDateType	= true;
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
		sign = ( self.isPositive() ) ? 1:-1;
		
		self.totalDays	= self.totalDays*sign;
	}			

}
//----------------------------------------------defines date element

