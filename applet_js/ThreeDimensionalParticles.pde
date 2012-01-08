//This sketch was abandoned because the trails did not work in Processing.js
//(time passed) But then resumed because not having trails is ok.

float curRotation = 0.0f;
float rotationSpeed = 0.05f;
float particleOriginX, particleOriginY, particleOriginZ;
float orbitSizeX, orbitSizeZ;
float yMax, yMin;
float particleFallRate;
float curY;
float fadeRate;

float testPartSpeed, testPartX, testPartY;

void setup() {
  size(500, 500, OPENGL);

  //debug
  testPartSpeed = 1.0f;
  testPartX = 0;
  testPartY = height / 2;

  noStroke();
  background(0);
  frameRate(30);
  //smooth();
    
  particleOriginX = width / 2;
  particleOriginY = height / 2;
  particleOriginZ = 0.0f;
  orbitSizeX = width / 2 - 100;
  orbitSizeZ = orbitSizeX;
  yMax = height;
  yMin = particleOriginY;
  curY = yMin;
  particleFallRate = 0.5f;
  fadeRate = 20;
}

void draw() {
  //fadeScreen();
  background(0);
  fill(0, 0, 200);
  //lights();
  float curX = particleOriginX + sin(frameCount * rotationSpeed) * orbitSizeX;
  float curZ = particleOriginZ + cos(frameCount * rotationSpeed) * orbitSizeZ;
  pushMatrix();
  translate(curX, curY, curZ);
  sphere(5);
  popMatrix();
  
  curY += particleFallRate;
  //falling means adding positively to the y axis
  if(curY > yMax) {
    curY = yMin;
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
  float posOriginX = width / 2;
  float posOriginY = height / 2;
  float speed = 1.0f;
  float fallRate = 0.0f;  
  float orbitSizeX = width / 2 - 100;
  float orbitSizeZ = orbitSizeX;
  int size = 5;
  Color col = new Color(0, 0, 255);
  
  Particle(float x, float y, float z) {
    posOriginX = x;
    posOriginY = y;
  }
  
  Particle() {
  }
  
  void draw() {
    pushMatrix();
    float curX = particleOriginX + sin(frameCount * rotationSpeed) * orbitSizeX;
    float curZ = particleOriginZ + cos(frameCount * rotationSpeed) * orbitSizeZ;
    fill(col);
    sphere(5);
    popMatrix();
  }
  
}

void fadeScreen() {
  pushMatrix();
  translate(0, 0, -300);
  fill(0, fadeRate);
  //box(width / 3);
  rect(-200, -200, width * 2, height * 2);
  popMatrix();
  
  
  pushMatrix();
  translate(0, 0);
  fill(0, faderate);
  rect(0, 0, width , 2 * height / 3);
  popMatrix();
}


