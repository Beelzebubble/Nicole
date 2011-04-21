package
{
	import org.flixel.*;

	public class Whirl extends FlxSprite
	{		
		[Embed(source="data/Whirl.png")] private var ImgWhirl:Class;

		public function Whirl():void
		{
			super(2768, 848);
			loadGraphic(ImgWhirl, true);
			
			addAnimation("idle",[0,1],10,true);
		}
		
		override public function update():void
		{
			play("idle");
		}
	}
}