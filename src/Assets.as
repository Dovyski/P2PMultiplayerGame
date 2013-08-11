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
	public class Assets 
	{
		[Embed(source = "../assets/mouse_pointer.png")] public static const MOUSE_POINTER :Class;
		
		// Art - Credits: "Remastered Tyrian Graphics", "Iron Plague" and "Hard Vacuum" by Daniel Cook (Lostgarden.com)
		[Embed(source="../assets/ships.png")] public static const SHIPS :Class;
		[Embed(source="../assets/background.png")] public static const BACKGROUND :Class;
		[Embed(source="../assets/explosion.png")] public static const EXPLOSION :Class;
		[Embed(source="../assets/explosion_nuke.png")] public static const EXPLOSION_NUKE :Class;
		[Embed(source="../assets/bomb1.png")] public static const BOMB :Class;
		
		// Sfx
		[Embed(source="../assets/sounds/hit0.mp3")] public static const SFX_HIT0 :Class; // http://www.superflashbros.net/as3sfxr/
		[Embed(source="../assets/sounds/hit1.mp3")] public static const SFX_HIT1 :Class; // http://www.superflashbros.net/as3sfxr/
		[Embed(source="../assets/sounds/explosion0.mp3")] public static const SFX_EXPLOSION0 :Class; // http://www.superflashbros.net/as3sfxr/
		[Embed(source="../assets/sounds/39068__alienbomb__explosion-1.mp3")] public static const SFX_EXPLOSION1 :Class; // alienbomb, http://www.freesound.org/people/alienbomb/sounds/39068/ (Public Domain)
	}
}