//This sketch was abandoned because the trails did not work in Processing.js
//(time passed) But then resumed because not having trails is ok.

float curRotation = 0.0f;
float particleOriginX, particleOriginY, particleOriginZ;
float orbitSizeX, orbitSizeZ;
float yMax, yMin;
float particleFallRate;
float curY;

float testPartSpeed, testPartX, testPartY;
int maxParticles = 20;
int curNumParticles = 1;
int minFramesBetweenParticleBirth = 30;
int framesUntilNextParticle;

Particle[] particles;

void setup() {
  size(500, 500, OPENGL);

  noStroke();
  background(0);
  frameRate(30);
  smooth();
  
  particles = new Particle[maxParticles];
  for (int i = 0; i < maxParticles; i++) {
    particles[i] = new Particle(random(0.3, 1.0f), random(0.04f, 0.07f));
  }
  
  framesUntilNextParticle = floor(random(minFramesBetweenParticleBirth, minFramesBetweenParticleBirth + 1));
}

void draw() {
  //fadeScreen();
  background(0);
  fill(0, 0, 200);
  lights();
    
  for (int i = 0; i < curNumParticles; i++) {
    particles[i].draw();
  }

  if (curNumParticles < maxParticles) {
    framesUntilNextParticle--;
    if (framesUntilNextParticle == 0) {
        curNumParticles++;
        framesUntilNextParticle = floor(random(minFramesBetweenParticleBirth, minFramesBetweenParticleBirth + 30));
    }
  }

  drawBox(300);
}

void drawBox(int boxSize) {
  pushMatrix();
  translate(width / 2 - boxSize / 2, height / 2 - boxSize / 2);
  fill(255, 0, 0);
  rect(0,0, boxSize, boxSize);
  popMatrix();
}

class Particle {
  float originX = width / 2;
  float originY = height;
  float originZ = 0.0f;
  float curY;
  float speed = 0.05f;
  float fallRate = 0.5f;  
  float orbitSizeX = width / 2 - 100;
  float orbitSizeZ = orbitSizeX;
  int size = 5;
  color col = color(0, 0, 255);
  int framesSinceBirth = 0;
  
  Particle(float _fallRate, float _speed) {
    //originX = width / 2;
    //originY = height / 2;
    curY = originY;
    fallRate = _fallRate;
    speed = _speed;
  }
  
  void draw() {
    framesSinceBirth++;
    float curX = originX + sin(framesSinceBirth * speed) * orbitSizeX;
    float curZ = originZ + cos(framesSinceBirth * speed) * orbitSizeZ;

    pushMatrix();
    translate(curX, curY, curZ);
    fill(col);
    sphere(5);
    popMatrix();
    curY -= fallRate;
    
    if(curY > height || curY < 0.0f) {
      curY = originY;
    }
  }
}

void fadeScreen() {
  pushMatrix();
  translate(0, 0, 0);
  fill(0, 0.2);
  //box(width / 3);
  rect(0, 0, width, height);
  popMatrix();
}


