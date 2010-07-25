package
{
	import mx.core.UIComponent;
	import mx.events.PropertyChangeEvent;

	/**
	 * This is a View object for a single rectangle on screen.
	 * 
	 * You can also take a look at RectangleView2.mxml to see how to do it in MXML code.
	 **/
	public class RectangleView extends UIComponent
	{
		protected var dataModel:RectangleModel;
		
		public function RectangleView(dataModel:RectangleModel)
		{		
			super();
			this.dataModel = dataModel;
			
			/*  This is a View component, it needs to listen to it's data model.
			    The PROPERTY_CHANGE event is dispatched from bindable objects
			    whenever a bindable property is changed.  We're using it here so we
			    can listen to a single event instead of creating ChangeWatchers for each
			    property we care about.
			*/			  
			dataModel.addEventListener( PropertyChangeEvent.PROPERTY_CHANGE, onPropertyChange );
			
			updateProperties(); // Set up our initial state.
		}
		
		/**
		 * Whenever our data model changes, this method gets called.
		 **/
		protected function onPropertyChange(event:PropertyChangeEvent):void
		{
			updateProperties(); // Set our internal state.
			invalidateDisplayList(); // Trigger the flex framework to call updateDisplayList at a later time
		}
		
		/**
		 * When properties change, we need to copy them from the data model to the visual component.
		 * In actionscript code, it looks something like this.  In an ideal world, we'd only copy
		 * properties that actually change, but this is such an easy example we'll copy them all.
		 **/
		protected function updateProperties() : void
		{
			x = dataModel.x;
			y = dataModel.y;
			width = dataModel.width;
			height = dataModel.height;
			rotation = dataModel.rotation;
		}
	
		/**
		 * This method actually draws the rectangle. 
		 **/
		override protected function updateDisplayList( unscaledWidth:Number, unscaledHeight:Number ) : void
		{
			super.updateDisplayList(unscaledWidth,unscaledHeight);
			graphics.clear();
			graphics.lineStyle(2,0);
			
			// Step 3 - set the background color 
			graphics.beginFill(dataModel.backgroundColor,1);
			graphics.drawRect(0,0,unscaledWidth,unscaledHeight);
			graphics.endFill();			
		}
		
	}
}