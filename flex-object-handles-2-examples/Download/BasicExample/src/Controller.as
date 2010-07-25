package
{
	/**
	 * This class represents a controller in our application than handles all of the non-object-handles specific
	 * pieces.  Things like adding or removing components are done here.
	 **/
	public class Controller
	{
		protected var dataModel:DataModel;
		
		
		public function Controller(dataModel:DataModel)
		{
			this.dataModel = dataModel;
		}
		
		/**
		 * Adds a square to the data model with the given position and size.
		 * 
		 * Note that this is only creating a data object and adding it to the model, we're
		 * not dealing with adding things to the display list here.  The View should be doing
		 * all of that work.
		 * 
		 **/
		public function addSquare(x:Number, y:Number, width:Number, height:Number ) : void
		{
			var rect:RectangleModel = new RectangleModel();
			rect.x = x;
			rect.y = y;
			rect.width = width;
			rect.height = height;
			dataModel.rectangles.addItem( rect );
		}
		
		/**
		 * Removes the last square that was added to the data model.
		 **/
		public function deleteLastSquare() : void
		{
			
			if(dataModel.rectangles.length == 0 ) return;
			
			dataModel.rectangles.removeItemAt( dataModel.rectangles.length - 1 );
			
			
		}

	}
}