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
	
	public class Hud extends FlxGroup
	{
		private var mHeadline 	:FlxText;
		private var mSub 		:FlxText;
		private var mTotal 		:FlxText;
		private var mSound 		:FlxButton;
		
		public function Hud() {
			mHeadline = new FlxText(0, FlxG.height / 2 - 50, FlxG.width, "");
			mHeadline.alignment = "center";
			mHeadline.size = 28;
			mHeadline.scrollFactor.x = 0;
			mHeadline.scrollFactor.y = 0;

			mSub = new FlxText(0, FlxG.height / 2 - 10, FlxG.width, "");
			mSub.alignment = "center";
			mSub.size = 12;
			mSub.scrollFactor.x = 0;
			mSub.scrollFactor.y = 0;
			
			mTotal = new FlxText(FlxG.width - 90, 5, 80, "Players: 0");
			mTotal.alignment = "right";
			mTotal.scrollFactor.x = 0;
			mTotal.scrollFactor.y = 0;
			
			mSound = new FlxButton(5, 5, "Sound: ON", toggleSound);
			mSound.scrollFactor.x = 0;
			mSound.scrollFactor.y = 0;

			hideMessages();
			
			add(mHeadline);
			add(mSub);
			add(mTotal);
			add(mSound);
		}
		
		private function toggleSound() :void {
			FlxG.mute = !FlxG.mute;
			mSound.label.text = "Sound: " + (FlxG.mute ? "OFF" : "ON");
		}
		
		public function showMessage(theHeadline :String, theSub :String, theSubFlickerTime :Number = 0.1) :void {
			mHeadline.visible = true;
			mSub.visible = true;
			mHeadline.text = theHeadline;
			mSub.text = theSub;
			
			mSub.flicker(theSubFlickerTime);
		}
		
		public function hideMessages() :void {
			mHeadline.visible = false;
			mSub.visible = false;
		}
		
		public function updatePlayersCount(theAmount :int) :void {
			mTotal.text = "Players: " + theAmount;
			mTotal.flicker(0.5);
		}
		
		override public function update():void {
			super.update();
			
			var aPlayer :Ship = (FlxG.state as PlayState).player;
			
			if (aPlayer != null && !aPlayer.alive) {
				mSub.text = "Respawn in " + (FlxG.state as PlayState).player.respawnCount.toFixed(1) + " seconds";
			}
		}
	}
}