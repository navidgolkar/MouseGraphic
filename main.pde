int n=300;
float[] xSpeed=new float[n];
float[] ySpeed=new float[n];
float[] rSpeed=new float[n];
float posX=0;
float posY=0;
float[] x=new float[n];
float[] y=new float[n];
float[] r=new float[n];
int[] fillColor1=new int[n];
int[] fillColor2=new int[n];
int[] fillColor3=new int[n];
int[] shape=new int[n];
int counter=0;
int remain=0;
boolean flag=false;

void setup() {
  size(640, 480);
  stroke(0, 0, 0);
}

void draw() {
  background(255);
  if (mousePressed) {
    if (flag==true) {
      counter=remain;
      flag=false;
    }
    if (counter<n) {
      x[counter]=mouseX;
      y[counter]=mouseY;
      xSpeed[counter]=random(-10, 10);
      ySpeed[counter]=random(-10, 10);
      rSpeed[counter]=random(-1, 1);
      r[counter]=(int) random(15, 25);
      fillColor1[counter]=(int)random(0, 255);
      fillColor2[counter]=(int)random(0, 255);
      fillColor3[counter]=(int)random(0, 255);
      shape[counter]=(int) random(1, 4); //1=circle, 2=square, 3=triangle
      counter++;
    }
  }
  for (int i=0; i<counter; i++) {
    x[i]=x[i]+xSpeed[i];
    y[i]=y[i]+ySpeed[i];
    if (r[i]+rSpeed[i] > 5 && r[i]+rSpeed[i] < 50) {
      r[i]=r[i]+rSpeed[i];
    }
    fill(fillColor1[i], fillColor2[i], fillColor3[i]);
    if (shape[i]==1) {
      circle(x[i], y[i], 2*r[i]);
    } else if (shape[i]==2) {
      square(x[i]-r[i]*sqrt(2)/2, y[i]-r[i]*sqrt(2)/2, r[i]*sqrt(2));
    } else {
      triangle(x[i], y[i]-r[i], x[i]-sqrt(3)*r[i]/2, y[i]+r[i]/2, x[i]+sqrt(3)*r[i]/2, y[i]+r[i]/2);
    }
  }
}
void mouseReleased() {
  flag=true;
  remain=0;
  for (int i=0; i<counter; i++) {
    if (x[i]+r[i]>0 && x[i]-r[i]<width && y[i]-r[i]<height && y[i]+r[i]>0) {
      x[remain]=x[i];
      y[remain]=y[i];
      xSpeed[remain]=xSpeed[i];
      ySpeed[remain]=ySpeed[i];
      rSpeed[remain]=rSpeed[i];
      r[remain]=r[i];
      fillColor1[remain]=fillColor1[i];
      fillColor2[remain]=fillColor2[i];
      fillColor3[remain]=fillColor3[i];
      shape[remain]=shape[i];
      remain++;
    }
  }
}
