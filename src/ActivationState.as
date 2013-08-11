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

	public class ActivationState extends FlxState
	{
		private var mHeadline 	:FlxText;
		private var mSub 		:FlxText;
		
		public function ActivationState() {
			mHeadline = new FlxText(0, FlxG.height / 2 - 50, FlxG.width, "Waiting");
			mHeadline.alignment = "center";
			mHeadline.size = 28;
			mHeadline.scrollFactor.x = 0;
			mHeadline.scrollFactor.y = 0;

			mSub = new FlxText(0, FlxG.height / 2 - 10, FlxG.width, "Click anywhere or press any key to start the game.");
			mSub.alignment = "center";
			mSub.size = 12;
			mSub.scrollFactor.x = 0;
			mSub.scrollFactor.y = 0;
			
			mSub.flicker(Number.MAX_VALUE);
			
			add(new Background());
			add(mHeadline);
			add(mSub);
		}
		
		override public function update():void {
			super.update();
			
			if (FlxG.mouse.pressed() || FlxG.keys.any()) {
				FlxG.switchState(new PlayState());
			}
		}
	}
}