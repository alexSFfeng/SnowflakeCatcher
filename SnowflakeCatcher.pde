SnowFlake [] winter;
void setup()
{
  size(600,600);
  background(0);
  winter = new SnowFlake[220];
  for(int i = 0 ; i < winter.length ; i++)
  {
    winter[i] = new SnowFlake();
  }  
}
void draw()
{
  for(int i = 0; i < winter.length ; i++)
  {    
    winter[i].erase();    
    winter[i].lookDown();    
    winter[i].move();
    winter[i].wrap();
    winter[i].show();

  }
  
}
void mouseDragged()
{
  if(mouseButton == LEFT)
  {
  fill(10,200,25,140);
  noStroke();
  ellipse(mouseX,mouseY,14,14);
  }

  if(mouseButton == RIGHT)
  {
    fill(0,0,0);
    noStroke();
    ellipse(mouseX,mouseY,15,15);
  }
}

class SnowFlake
{
  int snowX, snowY;
  boolean moving;
  SnowFlake()
  {
    snowX = (int)(Math.random()*601);
    snowY = (int)(Math.random()*601);
    moving = true;
  }
  void show()
  {
    fill(255,255,255,150);
    noStroke();
    ellipse(snowX,snowY,14,14);

  }
  void lookDown()
  {
    if (snowX > 0 && snowX < 600 && snowY>=0 && (snowY + 9<599) && (get(snowX,snowY+9) != color(0)))
    {
      moving = false;
    }
    else 
    {
     moving = true; 
    }
  }
  void erase()
  {
    fill(0,0,0);
    noStroke();
    ellipse(snowX,snowY,16,16);

  }
  void move()
  {
    if(moving == true)
    {
      snowY = snowY + 2;
      snowX = snowX + (int)(Math.random()*5) - 2;
    }
  }
  void wrap()
  {
        if(snowY > 600)
    {
      snowY = 0;
    }
  }
}


