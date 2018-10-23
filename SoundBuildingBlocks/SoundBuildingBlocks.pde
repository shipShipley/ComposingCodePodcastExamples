import processing.sound.*;

SinOsc sineWave;
SawOsc sawWave;
TriOsc triWave;
WhiteNoise whiteNoise;
Reverb reverb;
Env env;

  float Attack = 0.02;
  float Decay = 0.005;
  float Sustain = 0.3;
  float Release = 0.25;


void setup() {

  size(640, 360);
  background(124);
  

  
  sineWave = new SinOsc(this);
  sawWave = new SawOsc(this);
  triWave = new TriOsc(this);
  whiteNoise = new WhiteNoise(this);
  reverb = new Reverb(this);
  env = new Env(this);
  
  sineWave.play();
  sawWave.play();
  whiteNoise.play();
  
  reverb.process(sawWave);
  reverb.process(sineWave);
  
}

void draw() {
 
  //Map mouseY from 0 to 1
  float yoffset = map(mouseY, 0, height, 0, 0.2);
  float xoffset = map(mouseX, 0, width, 400, 1000);
  
  float yoffsetinv = map(mouseY, 0, height, 0.2, 0);
  float xoffsetinv = map(mouseX, 0, width, 1000, 400);
  
  sineWave.freq(xoffset);
  sineWave.amp(yoffset);
  
  sawWave.freq(xoffsetinv);
  sawWave.amp(yoffsetinv);
  
  whiteNoise.amp(0.2);
  whiteNoise.pan(map(mouseX, 0, width, -1.0, 1.0));
  
}

void mousePressed() {
    triWave.play();
    triWave.freq(random(300, 400));
    env.play(triWave, Attack, Decay, Sustain, Release);
}
