class AttackItem extends Bullet{
  AttackItem(Fighter _fighter){
    super(_fighter);
    syurui = 4; //4 = 攻撃用アイテム
    radius = 20;
    R = 255;
    G = 255;
    B = 0;
    move.x = 0;
    move.y = 10;
    position.x = random(radius / 2.0, width - radius / 2.0); //Fighterのど真ん中から発射する 
    position.y = 0; //Fighter の上から発射する
    HP = 1;
  }
  
  void Draw() {
    super.Draw();
  } 

}
