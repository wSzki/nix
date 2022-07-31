
/*
MiPlaits.ar(pitch: 60.0, engine: 0, harm: 0.1, timbre: 0.5, morph: 0.5, trigger: 0.0, level: 0, fm_mod: 0.0, timb_mod: 0.0, morph_mod: 0.0, decay: 0.5, lpg_colour: 0.5, mul: 1.0)
MiRings.ar(in: 0, trig: 0, pit: 60.0, struct: 0.25, bright: 0.5, damp: 0.7, pos: 0.25, model: 0, poly: 1, intern_exciter: 0, easteregg: 0, bypass: 0, mul: 1.0, add: 0)
*/

s.boot();

//(
//Server.load("./test.sc");
//"./test.sc".load;
//)

s.quit();
Server.default.boot;
(
a = MiPlaits.ar(pitch: 60.0, engine: 0, harm: 0.1, timbre: 0.5, morph: 0.5, trigger: 0.0, level: 0, fm_mod: 0.0, timb_mod: 0.0, morph_mod: 0.0, decay: 0.5, lpg_colour: 0.5, mul: 1.0);
{MiVerb.ar(a, time: 0.7, drywet: 0.5, damp: 0.5, hp: 0.05, freeze: 0, diff: 0.625, mul: 1.0, add: 0.0)}.play;
)
MiVerb.ar(pitch: 60.0, engine: 0, harm: 0.1, timbre: 0.5, morph: 0.5, trigger: 0.0, level: 0, fm_mod: 0.0, timb_mod: 0.0, morph_mod: 0.0, decay: 0.5, lpg_colour: 0.5, mul: 1.0)

(
{
	//some synthesis code
}.scope
)


// AMPLITUDE
(
{SinOsc.ar(440,0.0,0.1)}.scope			//provide freq and mul arguments directly
{SinOsc.ar(mul:0.1)}.scope			//provide just the multiplier argument explicitly
{0.1*SinOsc.ar}.scope					//multiply the SinOsc UGen by a constant
{SinOsc.ar(440, mul: -20.dbamp)}.scope   //use dBs! The conversion calculation is done just once at the
									    			     //initialisation of the UGen
)
// FILTER EXAMPLES
(
{LPF.ar(WhiteNoise.ar(0.1),1000)}.scope
Line.kr(10000,1000,10)
{LPF.ar(WhiteNoise.ar(0.1),Line.kr(000,10000,10))}.scope
{Resonz.ar(LFNoise0.ar(400),1000,0.1)}.scope
)
// SIMPLE FILTERED NOISE STRUCTURE
(
{
var source, line, filter; 	//local variables to hold objects as we build the patch up
source=LFNoise0.ar(400);
line=Line.kr(10000,1000,10);
filter=Resonz.ar(source,line,0.1); //the filtered output is the input source filtered by Resonz with a line control for the resonant frequency
filter // last thing is returned from function in curly brackets, i.e. this is the final sound we hear
}.scope;
)
// PLAITS
(
{
	var plaits;
	var plaits2;
	var pitch = 60;
	var engine = 2;
	var harm = 0.50;
	var timbre = 0.2;
	var morph = 0.6;
	var trigger = 1;
	plaits = {MiPlaits.ar(pitch, engine, harm, timbre, morph, trigger)}.play;
	//{MiPlaits.ar([58, 67, 71], 11, 0.4, 0.3, 0.6)}.play;
	//plaits2 = {MiPlaits.ar(60, 11, 0.4, 0.3, morph, trigger)}.scope;
}.scope
)

{SinOsc.ar(400,0,0.1) + SinOsc.ar(660,0,0.1)}.scope
// equivalent to
{SinOsc.ar([400,660],0,0.1)}.scope
{Pan2.ar(WhiteNoise.ar(0.1), MouseX.kr(-1,1))}.scope
//range pan from -1 to 1



( // MIDI
	// we initialise the MIDI client and the post window will output your devices
	MIDIClient.init;
	// the sources are the input devices you have plugged in
	MIDIClient.sources;
	// the destinations are the devices that can receive MIDI
	MIDIClient.destinations;
)
( // MIDI 2
	var notes, on, off;

	MIDIClient.init;
	MIDIIn.connectAll;

	notes = Array.newClear(128);    // array has one slot per possible MIDI note

	on = MIDIFunc.noteOn({ |veloc, num, chan, src|
		notes[num] = Synth(\default, [\freq, num.midicps,
			\amp, veloc * 0.00315]);
		});

		off = MIDIFunc.noteOff({ |veloc, num, chan, src|
			notes[num].release;
		});

		q = { on.free; off.free; };
	)
	// when done:
	q.value;

	( // DUST
		{ Dust.ar(80) }.play
		{ Dust.ar(100) }.play
	)
	( // WHITE NOISE
		{WhiteNoise.ar(0.4)}.plot(1)
		{WhiteNoise.ar(0.4)}.play
		{WhiteNoise.ar(0.4)}.scope
		{WhiteNoise.ar(0.4)}.freqscope
	)
	( //GUI
		w = Window.new("GUI Introduction", Rect(200,200,255,100));
		b = Button.new(w,Rect(10,0,80,30)).states_([["Hide"],["Show"]]);
		s = Slider.new(w,Rect(95,0,150,30));
		c = CompositeView.new(w,Rect(20,35,100,60));
		StaticText.new(c,Rect(0,0,80,30)).string_("Hello");
		StaticText.new(c,Rect(20,30,80,30)).string_("World!");
		b.action = { c.visible = b.value.asBoolean.not };
		s.action = { c.bounds = Rect( s.value * 150 + 20, 35, 100, 100 ) };
		w.front;
	)
	( // GUI 2
		var value = 0.5;
		w = Window.new.front;

		// (1) create a UserView
		v = UserView(w,Rect(50,50,200,20));

		// (2) define a drawing function using Pen
		v.drawFunc = {
			// Draw the fill
			Pen.fillColor = Color.grey;
			Pen.addRect(Rect(0,0, v.bounds.width*value,v.bounds.height));
			Pen.fill;
			// Draw the triangle
			Pen.fillColor = Color.red;
			Pen.moveTo(((v.bounds.width*value)-5) @ v.bounds.height);
			Pen.lineTo(((v.bounds.width*value)+5) @ v.bounds.height);
			Pen.lineTo(((v.bounds.width*value)) @ (v.bounds.height/2));
			Pen.lineTo(((v.bounds.width*value)-5) @ v.bounds.height);
			Pen.fill;
			// Draw the frame
			Pen.strokeColor = Color.black;
			Pen.addRect(Rect(0,0, v.bounds.width,v.bounds.height));
			Pen.stroke;
		};


		// (3) set the default action
		v.action = {value.postln; v.refresh};

		// (4) define mouse actions
		v.mouseDownAction = { arg view, x = 0.5,y, m;
			//m.postln;
			([256, 0].includes(m)).if{ // restrict to no modifier
				value = (x).linlin(0,v.bounds.width,0,1); v.doAction};
			};

			v.mouseMoveAction = v.mouseDownAction;

			// (5) (optional) define key actions
			v.keyDownAction = { arg view, char, modifiers, unicode,keycode;
				if (unicode == 16rF700, { value = (value+0.1).clip(0,1) });
				if (unicode == 16rF703, { value = (value+0.1).clip(0,1) });
				if (unicode == 16rF701, { value = (value-0.1).clip(0,1) });
				if (unicode == 16rF702, { value = (value-0.1).clip(0,1) });
				v.doAction;
			};

			// (6) (optional) define drag and drop behavior
			v.beginDragAction = {value}; // what to drag
			v.canReceiveDragHandler = {View.currentDrag.isNumber}; // what to receive
			v.receiveDragHandler = {value = View.currentDrag; v.doAction }; // what to do on receiving


			// just for testing drag and drop
			Slider(w,Rect(50,100,200,20));

			StaticText(w,Rect(50,150,350,50)).string_("To Test Drag and Drop,\nHold down Cmd (Ctl) Key");

		)

		(
			(
				w = Window("GUI Introduction").background_(Color.rand).front;
				b = Button(w, Rect(10,10,100,30)).states_([
					["One",Color.rand,Color.rand],
					["Two",Color.rand,Color.rand],
					["Three",Color.rand,Color.rand]
				]);
				l = ListView.new(w, Rect(10,50,200,100))
				.items_(["One","Two","Three"])
				.colors_([Color.rand,Color.rand,Color.rand])
				.hiliteColor_(Color.blue)
				.selectedStringColor_(Color.white);
				s = Slider(w, Rect(10, 160, 200, 20))
				.knobColor_(Color.rand)
				.background_(Color.rand);
			)
		)

		(
			{MiPlaits.ar(60, 11, 0.2, 0.1, 0.5, 0)}.play;
			{MiPlaits.ar(57, 11, 0.2, 0.1, 0.5, 0)}.play;
			{MiPlaits.ar(74, 12, 0.3, 0.1, 0.6, 0)}.play;
			{MiPlaits.ar(67, 11, 0.4, 0.1, 0.6, 0)}.play;
			{MiPlaits.ar(71, 11, 0.4, 0.1, 0.6, 0)}.play;
			{MiPlaits.ar(71, 8, 0.4, 0.1, 0.6, 0)}.play;
			//{MiPlaits.ar(57, 11, 0.4, 0.1, 1.6, 0)}.play;
			//{MiPlaits.ar(57, 12, 0.4, 0.1, 0.6, 0)}.play;

			{MiPlaits.ar(69, 6, 0.4, 0.1, 0.6, 0)}.play;

		)

		(
			Env.linen(1, 2, 3, 0.6).test.plot;
			Env.triangle(1, 1).test.plot;
			Env.sine(1, 1).test.plot;
			Env.perc(0.05, 1, 1, -4).test.plot;
			Env.adsr(0.2, 0.2, 0.5, 1, 1, 1).test.plot;
			Env.asr(0.2, 0.5, 1, 1).test.plot;
			Env.cutoff(1, 1).test(2).plot;
			// using .new you can define your own envelope with as many points as you like
			Env.new([0, 1, 0.3, 0.8, 0], [2, 3, 1, 4],'sine').test.plot;
			Env.new([0,1, 0.3, 0.8, 0], [2, 3, 1, 4],'linear').test.plot;
			Env.new({1.0.rand}!10, {2.0.rand}!9).test.plot;
			Env.new({1.0.rand}!100, {2.0.rand}!99).test.plot;

		)



		play{MiRings.ar(60, 1, 1, 1, 1, 1, 1, 1, 1)}
		//{ MiPlaits }

		play{MiRings.ar(OnePole.ar(Mix(
			LFSaw.ar([1,0.99],[0,0.6],2000,2000).trunc([400,600])*[1,-1]
		),0.98)).dup*0.1}

