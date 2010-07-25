
BasicExample				This is a basic example that shows how to use ObjectHandles in an MVC way
					Many of the other examples build off of this one, so it's important to 
					understand how it works first.  A good place to look first is 
					BasicExample.mxml 
					
DragNDropExample			This taks the BasicExample, removes the "add square" button and lets the
					user add squares by dragging and dropping them onto the canvas.


MultiObjectExample			Now that we have the ability to drag and drop items, lets extend that to
					support different types of objects to be dropped.
					
TextObjectExample			Lets take a look at two different ways to handle text.  The first gives 
					you a resizeable text area.  The second allows you to scale the text.
					This also shows how to use custom handles for some of your components.
					
ConstraintsExample			Takes the previous TextObjectExample and explores some constraints on
					objects including keeping things on screen, setting min or max sizes,
					keeping a constant aspect ratio, and a custom written constraint to
					force the text to be rotated in 30 degree increments.
					
DecoratorExample			Add some decorators to our example application.  We'll add lines that
					get drawn when items are aligned, and we'll add the ability for the
					user to link multiple items together.
					
FinishingTouches			Now lets add some finishing touches to our application including:
						a) A toolbar that lets us set the color of objects
						b) Change the delete button to actually delete the selected items
						c) Clear the selection when the user clicks on the background