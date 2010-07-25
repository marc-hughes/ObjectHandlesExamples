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
		
		/*
		  Step 4
		  We don't always want to add rectangles to our canvas, so let's create two new controller methods
		  addCircle and addImage.
		  
		  addCircle will do almost the exact same thing as our previous addSquare method did, but
		  it will create a CircleModel instead of a RectangleModel (go see that new class, it's just a
		  subclassed RectangleModel with no new properties)
		  
		  We use a different data model type here, so later when we want to display it we can know
		  to display a different type of view.
		  
		 */
		public function addCircle(x:Number, y:Number, width:Number, height:Number ) : void
		{
			var circle:CircleModel = new CircleModel();
			circle.x = x;
			circle.y = y;
			circle.width = width;
			circle.height = height;
			dataModel.shapes.addItem( circle );		
		}
		
		
		
		/* 
		  Step 5
		  
		  This method works a lot like the addCircle and addSquare methods, but it takes
		  an extra parameter to specify what image should be displayed.
		  
		  To store that extra param, the ImageModel has that property on it.  Go take a look
		  at ImageModel.as to see this.
		  
		  For Step 6 go look at addShapes in MultiObjectExample.mxml
		*/
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