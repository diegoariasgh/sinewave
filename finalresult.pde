float amp = 100;
float freq = .01;
int steps = 250;
float angle = 0;
float startAngle = 0;
float angle2 = noise(1, 40);

void setup() {
  size(1200, 800);
  frameRate(2);
  //noLoop();
}

void draw() {
  background(255);
  angle = startAngle;


  for (int i=0; i < width; i+=width/steps) {
    float xPos = i; //*noise(angle) + sin(angle);
    stroke(255, 0, 0);
    strokeWeight(5);
    line(0, height/2, width, height/2);

    stroke(55);
    strokeWeight(1);

    float yPos = sin(angle)*amp + height/2;
    yPos += cos(angle*1.2)*50*random(5, 20)/5;
    yPos *= sin(angle2 * 3);//*frameCount/1000;

    ellipse(xPos, yPos, 1, 1);
    ellipse(xPos + 10, yPos + 10, 2, 3);

    ellipse(xPos, height/2, 1, 1);
    line(xPos, height/2, xPos, yPos); 
    angle += freq;

    float xPos2 = xPos + noise(angle);
    float yPos2 = yPos + 10;
    fill(0, 0, 0, 100);
    ellipse(xPos2, yPos, 2, 2);

    float xPos3 = (xPos + (noise(angle) * 2)) + random(-1, 1);
    float yPos3 = yPos2 + 30;
    fill(0, 0, 0, 50);
    ellipse(xPos3 + 50, yPos3, 1, 1);

    float xPos4 = (xPos2 + (noise(angle))*1.5);
    float yPos4 = yPos3 - 50;
    fill(0, 0, 0, 50);
    ellipse(xPos4 + 40, yPos4, 3, 3);

    noFill();
    stroke(0, 0, 0, 50);

    if ((xPos < width/2)&&(yPos > height/2)) {
      bezier(0 - 200, height/2, 0, yPos, xPos3, yPos3, xPos4, yPos4);
    }
    if ((xPos > width/2)&&(yPos < height/2)) {
      bezier(xPos, yPos + 10, xPos3, yPos3, width, yPos4, width + 200, height/2);
      //line(yPos2, xPos2, yPos3, xPos3);
    }
  }

  startAngle+=.03;
}