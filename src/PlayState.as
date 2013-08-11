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
	
	public class PlayState extends FlxState
	{
		private var mPlayer 			:Ship;
		private var mShotLag 			:Number;
		private var mShips				:FlxGroup;
		private var mBullets			:FlxGroup;
		private var mBackground			:Background;
		private var mExplosions			:FlxGroup;
		private var mSounds				:Sounds;
		private var mHud				:Hud;
		private var mMultiplayer		:Multiplayer;
	
		override public function create():void {
			var i:int;
	
			mHud			= new Hud();
			mSounds 		= new Sounds();
			mShips			= new FlxGroup();
			mBullets 		= new FlxGroup(Constants.BULLET_MAX);
			mBackground		= new Background();
			mExplosions		= new FlxGroup();
			mMultiplayer	= new Multiplayer();
			mShotLag 		= 0;
			
			FlxG.worldBounds = new FlxRect(0, 0, Constants.WORLD_WIDTH, Constants.WORLD_HEIGHT);
			FlxG.camera.setBounds(0, 0, FlxG.worldBounds.width, FlxG.worldBounds.height);
			
			for (i = 0; i < Constants.BULLET_MAX; i++) {
				mBullets.add(new SimpleBullet());
				mBullets.add(new Bomb());
			}
			
			for (i = 0; i < 30; i++) {
				mExplosions.add(new Explosion());
				mExplosions.add(new ExplosionNuke());
			}
			
			add(mBackground);
			add(mShips);
			add(mBullets);
			add(mExplosions);
			add(mHud);
			
			super.create();
		}
		
		public function onHitByBullet(theBullet :Bullet, theShip :Ship) :void {
			if(theBullet.owner != theShip.owner && !theShip.flickering && theShip.alive && !(theBullet is Bomb)) {
				theShip.kill();
				handlePlayerKilled(theShip);
			}
		}
		
		public function onHitByExplosion(theExplosion :FlxBasic, theShip :Ship) :void {
			if(!theShip.flickering && theShip.alive && (theExplosion is ExplosionNuke)) {
				theShip.kill();
				handlePlayerKilled(theShip);
			}
		}
		
		private function handlePlayerKilled(thePlayerShip :Ship) :void {
			mMultiplayer.sendDie(thePlayerShip);
			mHud.showMessage("You were killed!", "Respawn in N seconds", Constants.PLAYER_RESPAWN);
		}
		
		override public function update():void {
			super.update();
			
			mMultiplayer.update();
			
			if (mPlayer != null) {
				updatePlayerInput();
				FlxG.overlap(mBullets, mPlayer, onHitByBullet);
				FlxG.overlap(mExplosions, mPlayer, onHitByExplosion);
			}
		}
		
		public function updatePlayerInput():void {
			if (!mPlayer.alive) return;
			
			if (mShotLag >= 0) {
				mShotLag -= FlxG.elapsed;
			}
			
			if ((FlxG.keys.pressed("SPACE") || FlxG.keys.pressed("B")) && mShotLag <= 0) {
				var aBulletType :Class = FlxG.keys.pressed("SPACE") ? SimpleBullet : Bomb;
				
				shoot(mPlayer, aBulletType, true);
				mShotLag = Constants.PLAYER_SHOT_LAG;
			}
			
			if (FlxG.keys.pressed("UP") || FlxG.keys.pressed("DOWN") || FlxG.keys.pressed("W") || FlxG.keys.pressed("S")) {
				var aSign :Number = FlxG.keys.pressed("DOWN") || FlxG.keys.pressed("S") ? -1 : 1;
				
				mPlayer.x += mPlayer.direction.x * aSign;
				mPlayer.y += mPlayer.direction.y * aSign;
			}
			
			if (FlxG.keys.pressed("RIGHT") || FlxG.keys.pressed("LEFT") || FlxG.keys.pressed("A") || FlxG.keys.pressed("D")) {
				mPlayer.rotate(FlxG.keys.pressed("RIGHT") || FlxG.keys.pressed("D") ? Constants.PLAYER_ROTATION : -Constants.PLAYER_ROTATION);
			}
		}
		
		public function shoot(theShip :Ship, theBulletType :Class, theShouldSendMultiplayer :Boolean = false) :void {
			var aBullet :Bullet;

			aBullet  = (FlxG.state as PlayState).bullets.getFirstAvailable(theBulletType) as Bullet;
			
			if (aBullet) {
				aBullet.goFrom(theShip);
				
				if (theShouldSendMultiplayer) {
					mMultiplayer.sendShot(theShip, theBulletType);
				}
				
				mSounds.play(Assets.SFX_HIT1);
			}
		}
		
		override public function destroy():void {
			mSounds.destroy();
			mSounds = null;
			
			super.destroy();
		}
		
		public function get bullets() :FlxGroup { return mBullets; }
		public function get ships() :FlxGroup { return mShips; }
		public function get player() :Ship { return mPlayer; }
		public function get explosion() :FlxGroup { return mExplosions; }
		public function get sounds() :Sounds { return mSounds; }
		public function get hud() :Hud { return mHud; }
		
		public function set player(v :Ship) :void { mPlayer = v; }
	}
}