 
class Bullet extends DisplayObject {
  float radius;
  //自機が発射する弾丸とするため，fighterを受け取ってその位置などを使う 
    Bullet(Fighter _fighter){
      super();
      syurui = 1; //1 = Bullet
      radius = 10;
      R = 255;
      G = 80;
      B = 0;
      move.x = 0;
      move.y = -30;
      position.x = _fighter.position.x + _fighter.size_x/2; //Fighterのど真ん中から発射する 
      position.y = _fighter.position.y - radius; //Fighter の上から発射する
      HP = 1;
    }
    
    Bullet(Fighter _fighter, Enemy _enemy){
      super();
      syurui = 3;
      radius = 10;
      R = 0;
      G = 80;
      B = 255;
      //move = _fighter.position.copy();
      move.x = _fighter.position.x + _fighter.size_x / 2.0;
      move.y = _fighter.position.y;
      PVector enemy_position = new PVector(_enemy.position.x + _enemy.size_x / 2.0, _enemy.position.y + _enemy.size_y);
      //enemy_position.x = _enemy.position.x + _enemy.size_x / 2.0;
      //enemy_position.y = _enemy.position.y + _enemy.size_y;
      move.sub(enemy_position);
      move.normalize();
      move.x *= 3;
      move.y *= 3;
      position.x = _enemy.position.x + _enemy.size_x/2; //enemyのど真ん中から発射する 
      position.y = _enemy.position.y + enemy.size_y + radius; //enemy の下から発射する
      HP = 1;
    }
    
    Bullet(Fighter _fighter, Boolean big){
      super();
      syurui = 5; //5 = big_Bullet
      radius = 300;
      R = 255;
      G = 255;
      B = 0;
      move.x = 0;
      move.y = -30;
      position.x = _fighter.position.x + _fighter.size_x/2; //Fighterのど真ん中から発射する 
      position.y = _fighter.position.y - radius; //Fighter の上から発射する
      HP = 10;
    }
  void Draw() {
    super.Draw();
    fill(R,G,B);
    ellipse(position.x, position.y, radius, radius); 
    position.add(move);//positionに移動ベクトルを加える
  } 
}
