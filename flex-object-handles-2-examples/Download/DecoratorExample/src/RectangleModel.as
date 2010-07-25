package
{
	/**
	 * This represents one of the rectangles on-screen.  We use a custom class instead of Rectangle so that it's Bindable
	 * and also so that we could add other properties later (like a label or color).
	 **/
	[Bindable] public class RectangleModel
	{
		public var x:Number = 0;
		public var y:Number = 0;
		public var width:Number = 10;
		public var height:Number = 10;
		public var rotation:Number = 0;
		
		/*
		  Step 7
		  
		  Add a list of items that this one is linked to.
		  
		  Go back to DecoratorExample for step 8
		*/
		public var linkedItems:Array = [];
	}
}