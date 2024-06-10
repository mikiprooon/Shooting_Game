class Enemy extends DisplayObject {
  float size_x, size_y;
  float hp_size_x, hp_size_y, hp_position_x, hp_position_y;
  
  Enemy(){
    super();
    size_x = random(30, 50);
    size_y = random(30, 50);
    HP = (int)random(1, 10);
    //HP = 20;
    ALL_HP = HP;
    R = (int)random(255);
    G = (int)random(255);
    B = (int)random(255);
    position.x = random(0, width);
    position.y = 0;
    move.x = random(-1, 1);
    move.y = random(0.1, 1);
    //move.y = 5;
    syurui = 2;
  }
  
  void Draw() {
    super.Draw();
    fill (R, G, B);
    position.x += move.x;
    position.y += move.y;
    /*if(position.x < 0){
      position.x -= move.x;
    }
    else if(position.x > width - size_x){
      position.x -= move.x;
    }*/
    if(position.x < 0 || position.x > width - size_x){
      position.x = constrain(position.x, 0, width - size_x);
      move.x *= random(-1, -0.1); //このブロックが何をやっているかリファレンスを調べたり理解しておくこと
    }
    
    
    rect(position.x, position.y, size_x, size_y);
    
    hp_size_x = ((float)HP / (float)ALL_HP) * size_x; //HPに合わせてゲージを小さくする
    hp_size_y = 10;
    hp_position_x = position.x;
    hp_position_y = position.y - 20;
    
    colorMode(HSB);
    fill(HP % 10 * 25, 255, 255);
  
    //fill(255, 255, 255);
    rect(hp_position_x, hp_position_y, hp_size_x, hp_size_y);
    colorMode(RGB);
    
  }
  
}
