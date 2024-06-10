//DisplayObjectを継承した(DisplayObjectの全ての機能を持った)Ballクラス 
class Ball extends DisplayObject{
  float radius; //Ballは，DisplayObjectが持っていないプロパティの半径を持つ. 下のプロパティも同様
  PVector move;
  
  //コンストラクタ 
  Ball(){
    super();//Superクラスのコンストラクタを呼んでおく 
    position.x = (int)random(0,width);
    position.y = (int)random(0,height);
    move = new PVector(random(3,10), random(3,10)); radius = random(10,30);
  }
  void Draw() {
    super.Draw(); //スーパークラス(継承元)のDrawメソッドを呼んでおく 
    position.add(move); //PVectorのAddメソッドでベクトルの足し算ができる
    // 位置情報に移動ベクトルを加える 
    if(position.x < radius || position.x > width - radius){
      position.x = constrain(position.x, radius, width - radius);
      move.x *= -1; //このブロックが何をやっているかリファレンスを調べたり理解しておくこと
    }
    if(position.y < radius || position.y > height- radius){
      position.y = constrain(position.y, radius, height - radius);
      move.y *= -1; 
    }
    ellipse(position.x, position.y, radius, radius); 
  }
}
