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
		public var linkedItems:Array = [];
		
		/* 
		   Step 2 
		   
		   A place to store the background color
		   
		   Next, the views need to respect this color.
		   See RectangleView.as, RectangleView2.mxml, CircleView.as or ImageView.as for step 3 - they're all pretty similar.  The image one is a little weird
		   since it needs to use a color transform.
		*/
		public var backgroundColor:uint = 0xeeeeee;
				
	}
}