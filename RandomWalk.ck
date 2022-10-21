240 => float bpm;
1::minute / bpm => dur quarter;
4::quarter => dur whole;
whole / 2 => dur half;
quarter / 2 => dur eighth;

// set up our patch
SinOsc x => dac;
SinOsc y => dac;

0.5 => float onGain;
0 => float offGain;

onGain => x.gain;
onGain => y.gain;

200 => int freqX;
freqX => int freqY;
50 => int stepFreqX;
stepFreqX => int stepFreqY;

freqX => x.freq;
freqY => y.freq;

dur step;
1 => float stepLen;
stepLen::ms => step;


while (true) {
  if (Math.random2(0,1)) {
    stepFreqX +=> freqX;
  } else if (stepFreqX > 0) {
    stepFreqX -=> freqX;
  }
  if (Math.random2(0,1)) {
    stepFreqY +=> freqY;
    
  } else if (stepFreqY > 0) {
    stepFreqY -=> freqY;
  }
  freqX => x.freq;
  freqY => y.freq;
  quarter => now;
  offGain => x.gain;
  offGain => y.gain;
  eighth => now;
  onGain => x.gain;
  onGain => y.gain;
}
