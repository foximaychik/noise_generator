 /*
 *
 * Tree Generation Sample
 * by @foximay
 *
 */

//Varibles

//Other
int temp_x = 500, temp_y=400, rh=70, treeh = 100;
PFont myFont;

//Tree textures
PImage oak;
PImage sakura;

//Colors
color plc = #ff0000;
color tc = #296b00;

//Noise Generation Variables

//Change the "seed" variable to change the seed. If you want to get random seed, you mustn't change anything.
int seed = seedGen(100, 1000);
float treesNum;
float wn;
float hn;
int tree_type;

//Main functions

void setup() {
  fullScreen(P2D);

  //Generator
  noiseSeed(seed);
  randomSeed(seed);
  treesNum = random(10, 1000);
  tree_type = (int) random(0, 2);

  //Smooth and Stroke
  smooth(8);
  noStroke();

  //Font
  myFont = createFont("Monocraft.ttf", 20);
  textFont(myFont);

  //Tree type
  oak = loadImage("tree_txr/oak_tree.png");
  sakura = loadImage("tree_txr/sakura_tree.png");
}
void draw() {
  background(56, 176, 0);

  fill(plc);
  rect(temp_x, temp_y, rh/2, rh);
  moving(6);

  //Generators
  treeSpawn((int) treesNum, 1);

  F5();
}

//Functions

int seedGen(int min, int max) {
  int r = (int) random(min, max);
  int t = (int) random(min, max);
  int y = (r + t) * 19;

  return y;
}

void moving(int speed) {
  //Cheking, is key  pressed
  if (keyPressed) {
    //moving switch
    switch (keyCode) {
    case UP:
      temp_y-=speed;
      break;
    case DOWN:
      temp_y+=speed;
      break;
    case RIGHT:
      temp_x+=speed;
      break;
    case LEFT:
      temp_x-=speed;
      break;
    }
  }
}
void treeSpawn(int num, float xoff) {
  for (int i = 0; i < 15; i++) {
    //Noise Generator Script
    xoff = xoff * num;
    noiseDetail(8, 0.56);
    wn = noise(xoff) * width;
    hn = noise(xoff) * height;
    wn = constrain(wn, 0, width - 10);
    hn = constrain(hn, 0, height - 10);

    //rect(wn, hn, rh/2, rh);

    //Tree Type Selector
    switch (tree_type) {
    case 0:
      image(oak, wn, hn, treeh, treeh);
      break;
    case 1:
      image(sakura, wn, hn, treeh, treeh);
      break;
    }
  }
}
void F5() {
  fill(255);
  text("DEV-06", 10, 20);
  text("FPS: " + (int) frameRate, 10, 50);
  text("Seed: " + seed, 10, 80);
  text("Width: " + width + ", Height: " + height, 10, 110);
  text("Tree Type: " + tree_type, 10, 140);
}
