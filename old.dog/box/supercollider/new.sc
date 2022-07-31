
// <C-e> send current block or line
// <M-e> send current line
// <F12> STOP
// <M-L> clear window buffer
// <C-k> Help
// K open docs



//////////////////
// QUICK RECORD //
//////////////////
// Start recording:
s.record;
// Make some cool sound
{Saw.ar(LFNoise0.kr([2, 3]).range(100, 2000), LFPulse.kr([4, 5]) * 0.1)}.play;
// Stop recording:
s.stopRecording;
// Optional: GUI with record button, volume control, mute button:
s.makeWindow;
Pbind(\degree, 0).play;

Pbind(\degree, Pseries(0, 1, 30), \dur, 0.05).play;
s.boot();
s.quit();
"Hello World".postln;
{SinOsc.ar}.play;
