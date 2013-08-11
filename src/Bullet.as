/**
 * Copyright (c) 2013, Fernando Bevilacqua
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 * 
 *   Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * 
 *   Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

package  
{
	import org.flixel.*;
	
	public class Bullet extends FlxSprite
	{
		private var mOwner :String;
		
		public function Bullet() {
			makeGraphic(2, 5, 0xffffffff);
			kill();
		}
		
		public function goFrom(theShip :Ship) :void {
			reset(theShip.x + theShip.width / 2, theShip.y + theShip.height / 2);
			
			velocity.x = theShip.direction.x * Constants.BULLET_SPEED;
			velocity.y = theShip.direction.y * Constants.BULLET_SPEED;
			
			angle = theShip.angle;
			owner = theShip.owner;
			
			if(theShip.multiplayerColor != 0) {
				color = theShip.multiplayerColor;
			}
		}
		
		override public function update():void {
			super.update();
			
			if (x < 0 || y < 0 || x > Constants.WORLD_WIDTH || y > Constants.WORLD_HEIGHT) {
				kill();
			}
		}
		
		public function get owner() :String { return mOwner; }
		public function set owner(v :String) :void { mOwner = v; }
	}
}