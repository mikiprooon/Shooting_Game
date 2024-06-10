//画面に表示される物体を示すクラス 
class DisplayObject{
  PVector position; //画面のどこに表示されるか 
  PVector move; 
  int R, G, B; 
  int syurui;
  int HP, ALL_HP;
  
  DisplayObject(){
    position = new PVector(0,0); 
    move = new PVector(0, 0);
    //speed = new PVector(0, 0);
  }
  void Draw(){}//DisplayObjectはDraw()メソッドを持つ 
}
