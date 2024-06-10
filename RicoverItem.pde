/*class RecoverItem extends Bullet{
  RecoverItemItem(Fighter _fighter){
    super(_fighter);
    syurui = 7; //7 = 回復アイテム
    radius = 20;
    R = 0;
    G = 255;
    B = 0;
    move.x = random(-1, 1);
    move.y = random(5, 10);
    position.x = random(radius / 2.0, width - radius / 2.0); //Fighterのど真ん中から発射する 
    position.y = 0; //Fighter の上から発射する
    HP = 1;
  }
  
  void Draw() {
    if(position.x - radius < 0 || position.x + radius > width){
      position.x = constrain(position.x, radius, width - radius);
      move.x *= random(-1, -0.1); //このブロックが何をやっているかリファレンスを調べたり理解しておくこと
    }
    super.Draw();
  } 

}*/
class RecoverItem extends Bullet{
  RecoverItem(Fighter _fighter){
    super(_fighter);
    syurui = 7; //7 = 回復アイテム
    radius = 20;
    R = 0;
    G = 255;
    B = 0;
    move.x = random(-1, 1);
    move.y = random(1, 5);
    position.x = random(radius / 2.0, width - radius / 2.0); //Fighterのど真ん中から発射する 
    position.y = 0; //Fighter の上から発射する
    HP = 5;
  }
  
  void Draw() {
    super.Draw();
    if(position.x - radius < 0 || position.x + radius > width){
      position.x = constrain(position.x, radius, width - radius);
      move.x *= random(-1, -0.1); //このブロックが何をやっているかリファレンスを調べたり理解しておくこと
    }
  } 

}
