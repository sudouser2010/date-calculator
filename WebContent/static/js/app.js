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
	
		

}
//----------------------------------------------defines date element

