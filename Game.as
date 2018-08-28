package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Game extends MovieClip {
		
		var isItPlayerOnesTurn:Boolean = true;
		var numberOfTurnsTaken:int = 0;
		
		public function Game() {
			
			b1.buttonMode = true;
			b2.buttonMode = true;
			b3.buttonMode = true;
			b4.buttonMode = true;
			b5.buttonMode = true;
			b6.buttonMode = true;
			b7.buttonMode = true;
			b8.buttonMode = true;
			b9.buttonMode = true;
			
			b1.stop();
			b2.stop();
			b3.stop();
			b4.stop();
			b5.stop();
			b6.stop();
			b7.stop();
			b8.stop();
			b9.stop();
			
			turn.stop();
			winnerlabel.stop();
			
			winnerlabel.visible = false;
			
			b1.addEventListener(MouseEvent.CLICK, handleClick);
			b2.addEventListener(MouseEvent.CLICK, handleClick);
			b3.addEventListener(MouseEvent.CLICK, handleClick);
			b4.addEventListener(MouseEvent.CLICK, handleClick);
			b5.addEventListener(MouseEvent.CLICK, handleClick);
			b6.addEventListener(MouseEvent.CLICK, handleClick);
			b7.addEventListener(MouseEvent.CLICK, handleClick);
			b8.addEventListener(MouseEvent.CLICK, handleClick);
			b9.addEventListener(MouseEvent.CLICK, handleClick);
			
			
			
		}
		
		function handleClick(e:MouseEvent):void {
			
			
			if(e.target.currentFrame != 1) return;
			
			if(isItPlayerOnesTurn){
				e.target.gotoAndStop(2);
			} else {
				e.target.gotoAndStop(3);
			}
			numberOfTurnsTaken = numberOfTurnsTaken + 1;
			trace("numberOfTurnsTaken = " + numberOfTurnsTaken);
			
			isItPlayerOnesTurn = !isItPlayerOnesTurn;
			
			changeTurnUIElement();
			
			var winner:int = checkForVictory();
			trace("winner = " + winner);
			Victory(winner);
			
			// toggle visibilty of UI elements
			// TODO: look for a winner...
			
		} // handleClick()
		
		function changeTurnUIElement():void {
			if (isItPlayerOnesTurn) {
				turn.gotoAndStop(1);
			} else {
				turn.gotoAndStop(2);
			}
		} //changeTurnUIElement()
		
		function checkForVictory():int {
			trace("in cfv")
			trace("b1 = " + b1.currentFrame);
			trace("b2 = " + b2.currentFrame);
			trace("b3 = " + b3.currentFrame);
			trace("b4 = " + b4.currentFrame);
			trace("b5 = " + b5.currentFrame);
			trace("b6 = " + b6.currentFrame);
			trace("b7 = " + b7.currentFrame);
			trace("b8 = " + b8.currentFrame);
			trace("b9 = " + b9.currentFrame);
			
			//horizontal
			if (b1.currentFrame == b2.currentFrame && b2.currentFrame == b3.currentFrame && b1.currentFrame != 1) {
				trace("123")
				return b1.currentFrame;
			}
			if (b4.currentFrame == b5.currentFrame && b5.currentFrame == b6.currentFrame && b4.currentFrame != 1) {
				trace("456")
				return b4.currentFrame;
			}
			if (b7.currentFrame == b8.currentFrame && b8.currentFrame == b9.currentFrame && b7.currentFrame != 1) {
				trace("789")
				return b7.currentFrame;
			}
			
			//vertical
			if (b1.currentFrame == b4.currentFrame && b4.currentFrame == b7.currentFrame && b1.currentFrame != 1) {
				trace("147")
				return b1.currentFrame;
			}
			if (b2.currentFrame == b5.currentFrame && b5.currentFrame == b8.currentFrame && b2.currentFrame != 1) {
				trace("258")
				return b2.currentFrame;
			}
			if (b3.currentFrame == b6.currentFrame && b6.currentFrame == b9.currentFrame && b3.currentFrame != 1) {
				trace("369")
				return b3.currentFrame;
			}
			
			// diag
			
			if (b1.currentFrame == b5.currentFrame && b5.currentFrame == b9.currentFrame && b1.currentFrame != 1) {
				trace("159")
				return b1.currentFrame;
			}
			if (b3.currentFrame == b5.currentFrame && b5.currentFrame == b7.currentFrame && b3.currentFrame != 1) {
				trace("357")
				return b3.currentFrame;
			}
			
			return 0;
		} //checkForVictor()
		
		function Victory(winner:int):void {
			if (winner == 2 ) {
				winnerlabel.visible = true;
				turn.visible = false;
			} else if(winner == 3) {
				winnerlabel.gotoAndStop(2);
				winnerlabel.visible = true;
				turn.visible = false;
			} else if(numberOfTurnsTaken == 9) {
				winnerlabel.gotoAndStop(3);
				winnerlabel.visible = true;
				turn.visible = false;
			}
		}// Victory()
		
	}
	
}
