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
	}
}