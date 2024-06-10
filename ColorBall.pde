class ColorBall extends Ball{
  int R, G, B;
  
  ColorBall(){
    super();//Superクラスのコンストラクタを呼んでおく 
    this.R = (int)random(255);
    this.G = (int)random(255);
    this.B = (int)random(255);
  }
  
  void Draw(){
    fill(R, G , B);
    super.Draw();
  }
  
}
