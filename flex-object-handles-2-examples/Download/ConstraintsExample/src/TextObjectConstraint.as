package
{
	import com.roguedevelopment.objecthandles.DragGeometry;
	import com.roguedevelopment.objecthandles.HandleRoles;
	import com.roguedevelopment.objecthandles.IConstraint;

	/*
	  Step 6
	  
	  To implement that custom constraint, we need a class that extends IConstraint
	  
	  In that interface, is an applyConstraint method.  It's passed in the original geometry,
	  how much the current user gesture is trying to change that (translation) and the current
	  handle role that's being used (from HandleRoles)
	  
	  To change what happens, you can modify the properties of the translation object.
	  
	  For step 7, see ConstraintsExample.mxml again
	 */
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