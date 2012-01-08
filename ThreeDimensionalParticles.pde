//This sketch was abandoned because the trails did not work in Processing.js
//(time passed) But then resumed because not having trails is ok.

float curRotation = 0.0f;
float rotationSpeed = 0.05f;
float particleOriginX, particleOriginY, particleOriginZ;
float orbitSizeX, orbitSizeZ;
float yMax, yMin;
float particleFallRate;
float curY;

float testPartSpeed, testPartX, testPartY;
int maxParticles = 1;

Particle[] particles;

void setup() {
  size(500, 500, OPENGL);

  noStroke();
  background(0);
  frameRate(30);
  smooth();
  
  particles = new Particle[maxParticles];
  particles[0] = new Particle(random(0.3, 1.0f));
  
}

void draw() {
  //fadeScreen();
  background(0);
  fill(0, 0, 200);
  lights();
    
  particles[0].draw();
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
  float speed = 1.0f;
  float fallRate = 0.5f;  
  float orbitSizeX = width / 2 - 100;
  float orbitSizeZ = orbitSizeX;
  int size = 5;
  color col = color(0, 0, 255);
  
  Particle(float _fallRate) {
    //originX = width / 2;
    //originY = height / 2;
    curY = originY;
    fallRate = _fallRate;
  }
  
  void draw() {
    pushMatrix();
    float curX = originX + sin(frameCount * rotationSpeed) * orbitSizeX;
    float curZ = originZ + cos(frameCount * rotationSpeed) * orbitSizeZ;
    translate(curX, curY, curZ);
    fill(col);
    sphere(5);
    popMatrix();
    curY -= fallRate;
    
    if(curY > height || curY < 0.0f) {
      curY = originY;
    }
    
    //DEBUG
    println(particleOriginX);
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

