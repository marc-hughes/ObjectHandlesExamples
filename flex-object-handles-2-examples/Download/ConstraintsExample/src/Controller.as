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
			dataModel.shapes.addItem( rect );
		}
		

		public function addCircle(x:Number, y:Number, width:Number, height:Number ) : void
		{
			var circle:CircleModel = new CircleModel();
			circle.x = x;
			circle.y = y;
			circle.width = width;
			circle.height = height;
			dataModel.shapes.addItem( circle );		
		}
		
		

		public function addImage(x:Number, y:Number, width:Number, height:Number , imageSource:String) : void
		{
			var image:ImageModel = new ImageModel();
			image.x = x;
			image.y = y;
			image.width = width;
			image.height = height;
			image.imageSource = imageSource;			
			dataModel.shapes.addItem( image );		
		}


		public function addText(x:Number, y:Number, width:Number, height:Number , scaleText:Boolean) : void
		{
			var text:TextModel = new TextModel();
			text.x = x;
			text.y = y;
			text.width = width;
			text.height = height;
			text.scaleText = scaleText;	
			
			dataModel.shapes.addItem( text );		
		}		
		/**
		 * Removes the last square that was added to the data model.
		 **/
		public function deleteLastSquare() : void
		{
			
			if(dataModel.shapes.length == 0 ) return;
			
			dataModel.shapes.removeItemAt( dataModel.shapes.length - 1 );
			
			
		}

	}
}