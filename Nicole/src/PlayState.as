package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{


		[Embed(source="data/map.png")] private var ImgMap:Class;
		[Embed(source="data/tiles.png")] private var ImgTiles:Class;
		[Embed(source = "data/background.png")] private var ImgBG:Class;

		private var _gameOverText: FlxText;
		protected var _player:Player;
		protected var _whirl:Whirl;
		
		
	override public function create():void
		{

			FlxState.bgColor = 0xffffffff;
			
			var decoration:FlxSprite = new FlxSprite(0, 0, ImgBG);
			decoration.scrollFactor.x = 1;
			decoration.solid = false;
			add(decoration);
			
			
			var t:FlxTilemap = new FlxTilemap();
			t.auto = FlxTilemap.ALT;
			t.loadMap(FlxTilemap.pngToCSV(ImgMap, false, 2), ImgTiles);
			add(t);
			
			_player = new Player();
			add(_player);
			FlxG.follow(_player, 2);
			FlxG.followBounds( -100, 0, t.width, t.height);
			
			_whirl = new Whirl();
			add(_whirl);
			

			
			super.create();
		}
		
		override public function update():void
		{
			
			FlxU.overlap(_player, _whirl, overlapWhirlPlayer);
			if (_player.y >= 960)
			{
				_player.kill();
				FlxG.followBounds(0, 0, 160, 120);
			}
			
			if(FlxG.keys.ENTER && _player.dead)
			{				
				if (_whirl.dead)
				{
				}
				else
				{
					FlxG.state = new PlayState();
				}
			}
				

			
			super.update();
			collide();

		}
		
		private function overlapWhirlPlayer(whirl: Whirl, player: Player):void
		{
			whirl.kill();
			player.kill();
			add(new FlxText(0, FlxG.height / 2, FlxG.width,"Game Over").setFormat(null,16,0x778ea1,"center"));
		}
		
	}
}
