package
{
	import com.roguedevelopment.objecthandles.DragGeometry;
	import com.roguedevelopment.objecthandles.HandleRoles;
	import com.roguedevelopment.objecthandles.IConstraint;


	public class TextObjectConstraint implements IConstraint
	{
		public function TextObjectConstraint()
		{
		}

		public function applyConstraint(original:DragGeometry, translation:DragGeometry, resizeHandleRole:uint):void
		{
			if( ! HandleRoles.isRotate( resizeHandleRole ) ) return; // don't do anything if we're not currently rotating.
			
			var ang:Number = original.rotation + translation.rotation; // Figure out the desired angle.
			ang = Math.round( ang/30) * 30;  // Round it to the nearest 30
			translation.rotation = ang - original.rotation; // Adjust the rotation to get it to the nearest 30
		}		
	}
}