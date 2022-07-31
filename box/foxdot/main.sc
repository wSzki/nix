





plaits = FileSynthDef("plaits"); plaits.add()
kick = FileSynthDef("./drums/kick1"); kick.add()

p1 >> kick()
// amp pan freq blur atk decay rel peak engine harm timbre morph cutoff


Clock.bpm = 140
Clock.clear()

var=[0.1,0.2,0.3]
//d1 >> play("dw", dur=[1/2, 1/3, 1/4], amp=var)

d3 >> play("V ",dur=1/2)



d4 >> play("V  V   ",dur=1/4,amp=0.2)
d5 >> play("V  V    s   ",dur=1/4,amp=0.7)


d8 >> play(" [--]",dur=1/2, amp=5)

d6 >> plaits(engine=7, dur=[1/4], harm=[0.4, 0.5,[0.2, 0.1,0.6]] + [0.1, -0.1,0], level=0.5, decay=0.05, atk=0)



d7 >> plaits(
  engine=7,
  dur=[1/4], 
  oct=[3, 3, 3, 3, 3, 7], 
  harm=[ 0.5,[0.2, 0.1,0.6]] + [0.1, -0.1,0],
  level=0.5, 
  decay=0.05, 
  atk=0)


d9 >> plaits(dur=1/4,engine=8, harm=0, timbre=[0,0.5,0.8], level=0.5, lpf=1000)

d6.stop()




d9 >> plaits(engine=13, level=1, amp=2, timbre=0.5, dur=1/2, decay=0.01, rel=0.1, oct=2)

