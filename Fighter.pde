class Fighter extends DisplayObject {
  int size_x, size_y; 
  int moveDirection;
  float hp_size_x, hp_size_y, hp_position_x, hp_position_y;
  Fighter() {
    super();
    size_x = 20;
    size_y = 40;
    position.x = width / 2 - size_x / 2; 
    position.y = height - 80;
    move.x = 15;
    move.y = 0;
    R = 255; 
    G = 255; 
    B = 255; 
    syurui = 0; // 0=Fighter
    HP = 20;
    ALL_HP = HP;
  }
  void Draw() {
    super.Draw();
    fill (R, G, B);
    //position.x += move.x * moveDirection;
    
    if(HP > 0){
      position.x = mouseX - size_x / 2;
      position.y = mouseY - size_y / 2;
    }
    
    
    if(position.x < 0){
      position.x = 0;
    }
    else if(position.x > width - size_x){
      position.x = width - size_x;
    }
    rect(position.x, position.y, size_x, size_y);
    
    if(HP < 0){
      HP = 0;
    }
    hp_size_x = ((float)HP / (float)ALL_HP) * size_x * 20; //HPに合わせてゲージを小さくする
    hp_size_y = 10;
    hp_position_x = width / 2 - size_x * 20 / 2;
    hp_position_y = height - 20;
    
    fill(255, 255, 255);
    rect(hp_position_x - 2, hp_position_y - 2, size_x * 20 + 4, hp_size_y + 4); //HPバーの外枠
    
    colorMode(HSB);
    fill(HP % 10 * 25, 255, 255);
  
    //fill(255, 255, 255);
    rect(hp_position_x, hp_position_y, hp_size_x, hp_size_y);
    colorMode(RGB);
    
  }
  
}
 
