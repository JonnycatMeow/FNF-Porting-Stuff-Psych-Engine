package android;

import flixel.FlxG;
import flixel.graphics.frames.FlxTileFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.util.FlxDestroyUtil;
import flixel.ui.FlxButton;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.FlxGraphic;

class FlxVirtualPad extends FlxSpriteGroup
{
	//Actions
	public var buttonA:FlxButton;
	public var buttonB:FlxButton;
	public var buttonC:FlxButton;
	public var buttonD:FlxButton;
	public var buttonE:FlxButton;
	public var buttonV:FlxButton;
	public var buttonX:FlxButton;
	public var buttonY:FlxButton;
	public var buttonZ:FlxButton;

	//DPad
	public var buttonLeft:FlxButton;
	public var buttonUp:FlxButton;
	public var buttonRight:FlxButton;
	public var buttonDown:FlxButton;
        
        //DUO PAD MODE
	public var buttonLeft2:FlxButton;
	public var buttonUp2:FlxButton;
	public var buttonRight2:FlxButton;
	public var buttonDown2:FlxButton;

	public var dPad:FlxSpriteGroup;
	public var actions:FlxSpriteGroup;

	public function new(?DPad:FlxDPadMode, ?Action:FlxActionMode)
	{
		super();

		dPad = new FlxSpriteGroup();
		actions = new FlxSpriteGroup();

		switch (DPad)
		{
			case UP_DOWN:
				dPad.add(add(buttonUp = createButton(0, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "up")));
				dPad.add(add(buttonDown = createButton(0, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "down")));
			case LEFT_RIGHT:
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "left")));
				dPad.add(add(buttonRight = createButton(42 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "right")));
			case UP_LEFT_RIGHT:
				dPad.add(add(buttonUp = createButton(35 * 3, FlxG.height - 81 * 3, 44 * 3, 45 * 3, "up")));
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "left")));
				dPad.add(add(buttonRight = createButton(69 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "right")));
			case FULL:
				dPad.add(add(buttonUp = createButton(35 * 3, FlxG.height - 116 * 3, 44 * 3, 45 * 3, "up")));
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 81 * 3, 44 * 3, 45 * 3, "left")));
				dPad.add(add(buttonRight = createButton(69 * 3, FlxG.height - 81 * 3, 44 * 3, 45 * 3, "right")));
				dPad.add(add(buttonDown = createButton(35 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "down")));
			case RIGHT_FULL:
				dPad.add(add(buttonUp = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 116 * 3, 44 * 3, 45 * 3, "up")));
				dPad.add(add(buttonLeft = createButton(FlxG.width - 128 * 3, FlxG.height - 66 - 81 * 3, 44 * 3, 45 * 3, "left")));
				dPad.add(add(buttonRight = createButton(FlxG.width - 44 * 3, FlxG.height - 66 - 81 * 3, 44 * 3, 45 * 3, "right")));
				dPad.add(add(buttonDown = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 45 * 3, 44 * 3, 45 * 3, "down")));
                        case DUO:
                                //Left Part
				dPad.add(add(buttonUp = createButton(35 * 3, FlxG.height - 116 * 3, 44 * 3, 45 * 3, "up")));
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 81 * 3, 44 * 3, 45 * 3, "left")));
				dPad.add(add(buttonRight = createButton(69 * 3, FlxG.height - 81 * 3, 44 * 3, 45 * 3, "right")));
				dPad.add(add(buttonDown = createButton(35 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "down")));
                                
                                //Right Part
				dPad.add(add(buttonUp2 = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 116 * 3, 44 * 3, 45 * 3, "up")));
				dPad.add(add(buttonLeft2 = createButton(FlxG.width - 128 * 3, FlxG.height - 66 - 81 * 3, 44 * 3, 45 * 3, "left")));
				dPad.add(add(buttonRight2 = createButton(FlxG.width - 44 * 3, FlxG.height - 66 - 81 * 3, 44 * 3, 45 * 3, "right")));
				dPad.add(add(buttonDown2 = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 45 * 3, 44 * 3, 45 * 3, "down")));
			case NONE:
		}

		switch (Action)
		{
			case A:
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a")));
                        case B:
				actions.add(add(buttonB = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b")));
		        case D:
				actions.add(add(buttonD = createButton(FlxG.width - 44 * 3, FlxG.height - 125 * 3, 44 * 3, 45 * 3, "d")));						
			case A_B:
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a")));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b")));
			case A_B_C:
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a")));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b")));
  			        actions.add(add(buttonC = createButton(FlxG.width - 44 * 3, FlxG.height - 125 * 3, 44 * 3, 45 * 3, "c")));   				
			case A_B_E:
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a")));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b")));
  			        actions.add(add(buttonE = createButton(FlxG.width - 44 * 3, FlxG.height - 125 * 3, 44 * 3, 45 * 3, "e")));   
 			case A_B_X_Y:
				actions.add(add(buttonY = createButton(FlxG.width - 170 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "y")));
				actions.add(add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "x")));

				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b")));								
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a")));	 			               
			case A_B_C_X_Y:		
                                actions.add(add(buttonC = createButton(FlxG.width - 44 * 3, FlxG.height - 125 * 3, 44 * 3, 45 * 3, "c")));
				actions.add(add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "y")));
				actions.add(add(buttonX = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "x")));

				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b")));
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a")));				
                        case A_B_C_X_Y_Z:
				actions.add(add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "x")));
				actions.add(add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "y")));
				actions.add(add(buttonZ = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "z")));

				actions.add(add(buttonA = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a")));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b")));
				actions.add(add(buttonC = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "c")));	
                        case FULL:
				actions.add(add(buttonV = createButton(FlxG.width - 170 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "v")));            
				actions.add(add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "x")));
				actions.add(add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "y")));
				actions.add(add(buttonZ = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "z")));

				actions.add(add(buttonA = createButton(FlxG.width - 170 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a")));				
				actions.add(add(buttonB = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b")));
				actions.add(add(buttonC = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "c")));
				actions.add(add(buttonD = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "d")));										
			case NONE:
		}
	}

	public function createButton(X:Float, Y:Float, Width:Int, Height:Int, Graphic:String):FlxButton
	{
		var button = new FlxButton(X, Y);
		var frame = getVirtualInputFrames().getByName(Graphic);
		button.frames = FlxTileFrames.fromFrame(frame, FlxPoint.get(Width, Height));
		button.resetSizeFromFrame();
		button.solid = false;
		button.immovable = true;

    	        #if FLX_DEBUG
		button.ignoreDrawDebug = true;
		#end

		return button;
	}

	public static function getVirtualInputFrames():FlxAtlasFrames
	{
		return Paths.getPackerAtlas('androidcontrols/virtualpad');
	}

	override public function destroy():Void
	{
		super.destroy();

		dPad = FlxDestroyUtil.destroy(dPad);
		actions = FlxDestroyUtil.destroy(actions);

		dPad = null;
		actions = null;
		buttonA = null;
		buttonB = null;
		buttonC = null;
		buttonD = null;
		buttonE = null;

		buttonV = null;	
		buttonX = null;	
		buttonY = null;
		buttonZ	= null;	

		buttonLeft = null;
		buttonUp = null;
		buttonDown = null;
		buttonRight = null;

		buttonLeft2 = null;
		buttonUp2 = null;
		buttonDown2 = null;
		buttonRight2 = null;
	}
}

enum FlxDPadMode
{
	UP_DOWN;
	LEFT_RIGHT;
	UP_LEFT_RIGHT;
	FULL;
	RIGHT_FULL;
        DUO;
        NONE;
}

enum FlxActionMode
{
	A;
        B;
 	D;   
	A_B;
	A_B_C;
	A_B_E;
	A_B_X_Y;	
	A_B_C_X_Y;
	A_B_C_X_Y_Z;
	FULL;
	NONE;
}
