package
{
	import flash.events.Event;
	
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.geom.Matrix;

	
	public class Food extends UIComponent 
	{
		import flash.events.TimerEvent;
		import flash.utils.Timer;
		
		//embedding images
		[Embed(source="../images/AppleSauce.png")]
		private var AppleSauce:Class;
		
		[Embed(source="../images/BabyFood.png")]
		private var BabyFood:Class;
		
		[Embed(source="../images/Milk.png")]
		private var Milk:Class;

		[Embed(source="../images/pizza.png")]
		private var Pizza:Class;
		
		[Embed(source="../images/Soda.png")]
		private var Soda:Class;
		
		[Embed(source="../images/Chips.png")]
		private var Chips:Class;
		
		[Embed(source="../images/soup.png")]
		private var Soup:Class;
		
		[Embed(source="../images/Tea.png")]
		private var Tea:Class;
		
		[Embed(source="../images/rice.png")]
		private var Rice:Class;
		
		public var food:BitmapData
		
		//initializing variables
		public var foodName:String
		public var yVelocity:int;
		public var radius:int = 10;
		
		//Creation of position timer to update position as food falls
		private var position:Timer = new Timer(3,0);
		public function Food(foodName:String, yVelocity:int, xPos:int)
		{
			super();
			this.foodName = foodName;
			this.yVelocity = this.y;
		
			
			addEventListener(FlexEvent.CREATION_COMPLETE, init);
			position.start();
			addEventListener(Event.ENTER_FRAME, startPTimer)
		}
		
		//initializing function
		protected function init(event:FlexEvent):void
		{

			draw();			
		}
		
		protected function startPTimer(event:Event):void{
			position.addEventListener(TimerEvent.TIMER, fall);}
		
		//this draws the food items
		public function draw():void
		{
			graphics.clear();
			
			if(foodName=="babyfood"){
				food = new BabyFood().bitmapData
			}else if(foodName=="appleSauce"){
				food= new AppleSauce().bitmapData
			}else if(foodName=="milk"){
				food= new Milk().bitmapData
			}else if(foodName=="pizza"){
				food= new Pizza().bitmapData
			}else if(foodName=="soda"){
				food= new Soda().bitmapData
			}else if(foodName=="chips"){
				food= new Chips().bitmapData
			}else if(foodName=="soup"){
				food= new Soup().bitmapData
			}else if(foodName=="tea"){
				food= new Tea().bitmapData		
			}else if(foodName=="rice"){
				food= new Rice().bitmapData
			}
			
			var mtx:Matrix=new Matrix();
			mtx.translate(0,0);
			graphics.beginBitmapFill(food,mtx,false,false)
			graphics.drawRect(0,0,food.width,food.height)
			graphics.endFill()
				
		}
		
		//this creates the faling movement of the food items 
		public function fall(event:TimerEvent):void
		{
			if (this.y < stage.stageHeight){
				this.y++;
				yVelocity =this.y;
			}else {removeEventListener(TimerEvent.TIMER,fall);
				graphics.clear();
			}
		}
		
		

	}
}
