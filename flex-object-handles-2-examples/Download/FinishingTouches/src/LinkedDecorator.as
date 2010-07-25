package
{
	import com.roguedevelopment.objecthandles.decorators.IDecorator;
	
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;

	public class LinkedDecorator implements IDecorator
	{
		public function LinkedDecorator()
		{
		}

		public function updateSelected(allObject:Array, selectedObjects:Array, drawingCanvas:Sprite):void
		{
			drawWeb(allObject,drawingCanvas);
		}
		
		public function updatePosition(allObject:Array, selectedObjects:Array, movedObjects:Array, drawingCanvas:Sprite):void
		{
			drawWeb(allObject,drawingCanvas);
		}
		
		public function cleanup(drawingCanvas:Sprite):void
		{
		}
		
		protected function drawWeb( objects:Array, drawingCanvas:Sprite):void
		{
			drawingCanvas.graphics.clear();
			drawingCanvas.graphics.lineStyle(5,0x777777);
			var middle:Point = new Point(0,0);
			var rotationMatrix:Matrix = new Matrix();
			
			for( var i:int = 1 ; i < objects.length ; i++ )
			{
				for( var j:int=(i+1) ; j < objects.length ; j++ )
				{
					var obj1:RectangleModel = objects[i];
					var obj2:RectangleModel = objects[j];
					
					if( obj1.linkedItems.indexOf( obj2 ) != -1 )
					{
						rotationMatrix.identity();
						rotationMatrix.rotate( toRadians( obj1.rotation ) );
						middle.x = obj1.width / 2;
						middle.y = obj1.height / 2;
						var p1:Point = rotationMatrix.transformPoint( middle );
						
						rotationMatrix.identity();
						rotationMatrix.rotate( toRadians( obj2.rotation ) );
						middle.x = obj2.width / 2;
						middle.y = obj2.height / 2;
						var p2:Point = rotationMatrix.transformPoint( middle );

						
						drawingCanvas.graphics.moveTo( objects[i].x + p1.x, objects[i].y + p1.y );		
						drawingCanvas.graphics.lineTo( objects[j].x + p2.x, objects[j].y + p2.y );
					}					
				}
			}			
		}	
		
		
		protected static function toRadians( degrees:Number ) :Number
        {
            return degrees * Math.PI / 180;
        }
	
		
	}
}