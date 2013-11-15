package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	
	
	public class Player extends UIComponent
	{
		
		//Baby embeded images
		[Embed(source="../images/CrawlingBaby.png")]
		private var Baby:Class;
		[Embed(source="../images/idleBaby.png")]
		private var BabyIdle:Class;
		
		//Old Man embeded images
		[Embed(source="../images/BoyWalking.png")]
		private var BoyHover:Class;
		[Embed(source="../images/BoyStanding.png")]
		private var BoyIdle:Class;
		
		//Old Man embeded images
		[Embed(source="../images/OldMan.png")]
		private var OldHover:Class;
		[Embed(source="../images/OldManWalking.png")]
		private var OldIdle:Class;
		
		public var myBitmap:BitmapData// = new Baby().bitmapData;
		public var Idle:BitmapData// = new BabyIdle().bitmapData;
		
		
		//declaring state variables
		public static const IDLE:String = "idle";
		public static const HOVER:String = "hover";
		
		public var state:String;
		public var Playerlevel:int;

		
		
		public function Player()
		{
		super();
       	//set images
		if(Playerlevel==1)
			{myBitmap = new Baby().bitmapData;
			Idle = new BabyIdle().bitmapData;}
		else if(Playerlevel==2)
			{myBitmap = new BoyHover().bitmapData;
			Idle = new BoyIdle().bitmapData;}
		else {myBitmap = new OldHover().bitmapData;
			Idle = new OldIdle().bitmapData;}
	
		height=myBitmap.height
		//Adding event listeners

			addEventListener(FlexEvent.CREATION_COMPLETE, init);
			addEventListener(MouseEvent.MOUSE_OVER,mouseOver);
			addEventListener(MouseEvent.MOUSE_OUT,MouseOut);
		}
		
		// initializing state
		protected function init(event:FlexEvent):void
		{
			state = IDLE
			draw();
		}
		
		//Drag player when mouse over
		protected function mouseOver(event:MouseEvent):void
		{
			var bounds:Rectangle = new Rectangle(0, y, parent.width-myBitmap.width, 0);	
			if (state==IDLE){
				state=HOVER;
				startDrag(false,bounds)
				draw();	
				addEventListener(MouseEvent.MOUSE_OUT,MouseOut);
			}
		}
		
		//Stop dragging user when mouse is out
		protected function MouseOut(event:MouseEvent):void
		{
			if (state==HOVER){
				state= IDLE;
				draw();	
				stopDrag();
				removeEventListener(MouseEvent.MOUSE_OUT, MouseOut);
			}
		}
		
		//Drawing the user
		public function draw():void
		{
			graphics.clear();
			
			if(Playerlevel==1)
			{myBitmap = new Baby().bitmapData;
				Idle = new BabyIdle().bitmapData;}
			else if(Playerlevel==2)
			{myBitmap = new BoyHover().bitmapData;
				Idle = new BoyIdle().bitmapData;}
			else {myBitmap = new OldHover().bitmapData;
				Idle = new OldIdle().bitmapData;}
			
			height=myBitmap.height
			
			var mtx:Matrix=new Matrix();
			mtx.translate(0,0);
			//var radius:int = parent.width/2;
			//graphics.beginBitmapFill(myBitmap,mtx,false,false)
			switch (state){
					case IDLE:{graphics.beginBitmapFill(Idle,mtx,false,false)};break;
					case HOVER:{graphics.beginBitmapFill(myBitmap,mtx,false,false)};break;}
					
			graphics.drawRect(0,0,myBitmap.width,myBitmap.height)
			graphics.endFill()
			
		}
		}
	}
