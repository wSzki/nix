




sclang & << EOF
FoxDot.start()


(
SynthDef(\plaits, { |out|
  Out.ar(out,
    MiPlaits.ar()
  )
}).add;

(
SynthDef(\element, { |out|
  Out.ar(out,
    MiElement.ar()
  )
}).add;


)


EOF

python -m FoxDot  &
