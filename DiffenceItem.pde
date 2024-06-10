class DiffenceItem extends Bullet{
  DiffenceItem(Fighter _fighter){
    super(_fighter);
    syurui = 6; //6 = 防御用アイテム
    radius = 20;
    R = 255;
    G = 0;
    B = 255;
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
