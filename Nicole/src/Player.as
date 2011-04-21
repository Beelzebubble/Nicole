package
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		[Embed(source = "data/nicole.png")] private var ImgPlayer:Class;
		
		public function Player():void
		{
			
			super(2800, 400); // (100, 660)
			loadGraphic(ImgPlayer,true);
			maxVelocity.x = 100;
			acceleration.y = 400;
			drag.x = maxVelocity.x*10;
			
			//tweak the bounding box for better feel
			width = 19;
			height = 48;
			offset.x = 5;
			offset.y = 0;
			
			addAnimation("idle",[0,1,2],10,true);
			addAnimation("walk",[3,4],5,true);
			addAnimation("walk_back",[5, 6],5,true);
		}
		
		
		override public function update():void
		{
			
			//Smooth slidey walking controls
			acceleration.x = 0;
			if (FlxG.keys.justPressed("UP"))
				if (onFloor)
					velocity.y = -acceleration.y * 0.5;
			if(FlxG.keys.LEFT)
				acceleration.x -= drag.x;
			if(FlxG.keys.RIGHT)
				acceleration.x += drag.x;
			
			if(onFloor)
			{
				//Jump controls
				if (velocity.x == 0)
				{
						play("idle");
				}
				else if(FlxG.keys.justPressed("UP"))
					play("idle");


				else if(velocity.x > 0)
					play("walk");
				else if(velocity.x < 0)
					play("walk_back");
				else
					play("idle");
			}
			else if(velocity.y < 0)
				play("idle");
			else
				play("idle");
			

			super.update();
		}
	}
}