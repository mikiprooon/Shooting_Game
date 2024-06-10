
import ddf.minim.*;
Minim minim;
AudioSample bullet_sound, damage_sound, explosion_sound;

/*int ObjNum = 100;
DisplayObject[] objects = new DisplayObject[ObjNum];
int Counter = 0;*/
ArrayList<DisplayObject>objects = new ArrayList<DisplayObject>();
Fighter fighter; //自分だけなのでグローバル変数
Enemy enemy;
int score = 0;
boolean make_enemy = true;
int mode = 0; //0: スタート画面、1: プレイ画面、2: ゲームオーバー画面
boolean big_bullet = false;
int muteki_time = 0;

void setup() {
  size(600,600);
  fighter = new Fighter();
  enemy = new Enemy();
  
  /*for (int i = 0; i < objects.size(); i++){
    objects.add(new ColorBall()); 
    //“Ball is a DisplayObject”なのでスーパークラスの配列にも入れられる この考え方めちゃくちゃ重要
  } */
  objects.add(fighter);
  objects.add(enemy);
  
  minim = new Minim(this);
  bullet_sound = minim.loadSample("Bullet.mp3");
  damage_sound = minim.loadSample("Damage.mp3");
  explosion_sound = minim.loadSample("Explosion.mp3");
  
}
void draw() {
  fill(0,0,0,100);
  rect(0, 0, width, height);
  
  if(mode == 0){
    fill(255, 255, 255);
    textAlign(CENTER, CENTER); //基準を文字列真ん中に
    text("S T A R T", width / 2, height / 2);//画面中央に表示
    textAlign(TOP,LEFT);
    
    if(frameCount >= 300){
      mode = 1;
    }
    
  }
  else if(mode == 1){
    fill(255, 255, 255);
    textAlign(CENTER, CENTER); //基準を文字列真ん中に
    String s = "SCORE: " + String.valueOf(score);
    text(s, 0.9 * width, 0.1 * height);//画面中央に表示
    
    if(frameCount <= 900){
      if(frameCount % 120 == 0 && make_enemy == true){ //2秒に一回出現
        enemy = new Enemy();
        objects.add(enemy);
      }
    }
    else if(frameCount <= 1500){
      if(frameCount % 90 == 0 && make_enemy == true){ //1.5秒に一回出現
          enemy = new Enemy();
          objects.add(enemy);
      }
    }
    else if(frameCount <= 2100){
      if(frameCount % 60 == 0 && make_enemy == true){ //1秒に一回出現
          enemy = new Enemy();
          objects.add(enemy);
      }
    }
    else if(frameCount <= 2700){
      if(frameCount % 30 == 0 && make_enemy == true){ //0.5秒に一回出現
          enemy = new Enemy();
          objects.add(enemy);
      }
    }
    else{
      if(frameCount % 15 == 0 && make_enemy == true){ //0.25秒に一回出現
          enemy = new Enemy();
          objects.add(enemy);
      }
    }
    
    
    for(int i = 0; i < objects.size(); i++){
      if(frameCount <= 600){
        if((int)random(0, 100) % 99 == 0 && objects.get(i).syurui == 2){
          Bullet b = new Bullet((Fighter)objects.get(0), (Enemy)objects.get(i));
          objects.add(b);
        }
      }
      else if(frameCount <= 1200){
        if((int)random(0, 100) % 74 == 0 && objects.get(i).syurui == 2){
          Bullet b = new Bullet((Fighter)objects.get(0), (Enemy)objects.get(i));
          objects.add(b);
        }
      }
      else if(frameCount <= 1800){
        if((int)random(0, 100) % 50 == 0 && objects.get(i).syurui == 2){
          Bullet b = new Bullet((Fighter)objects.get(0), (Enemy)objects.get(i));
          objects.add(b);
        }
      }
      else{
        if((int)random(0, 100) % 25 == 0 && objects.get(i).syurui == 2){
          Bullet b = new Bullet((Fighter)objects.get(0), (Enemy)objects.get(i));
          objects.add(b);
        }
      }
      
      
    }
   if(frameCount >= 600){
      if(frameCount % 180 == 0){
        AttackItem ai = new AttackItem((Fighter)objects.get(0));
        objects.add(ai);
      }
      else if(frameCount % 180 == 60){
        DiffenceItem di = new DiffenceItem((Fighter)objects.get(0));
        objects.add(di);
      }
      else if(frameCount % 180 == 120){
        RecoverItem ri = new RecoverItem((Fighter)objects.get(0));
        objects.add(ri);
      }
    
    }
  
    for(int i = 0; i < objects.size();i++) {
      objects.get(i).Draw(); //.get(i)で配列の番号のDisplayObjectを指定する 
      if(objects.get(i).syurui ==1 && objects.get(i).position.y < 0){
        objects.remove(i); //表示インスタンスがBulletクラス，かつそのBulletが画面外に出たら削除
        i--;
      }
      else if(objects.get(i).syurui ==2 && objects.get(i).position.y > height){
        objects.remove(i); //表示インスタンスがEnemyクラス，かつそのEnemyが画面下外に出たら削除 
        i--;
      }
      else if(objects.get(i).syurui == 4 && objects.get(i).position.y > height){
        objects.remove(i); //表示インスタンスがEnemyクラス，かつそのEnemyが画面下外に出たら削除 
        i--;
      }
    }
    Collision(objects, muteki_time);
  }
  else{
    fill(255, 255, 255);
    textAlign(CENTER, CENTER); //基準を文字列真ん中に
    text("G a m e  O v e r", width / 2, height / 2);//画面中央に表示
    
    make_enemy = false;
    /*for(int k = 0; k < objects.size(); k++){
      objects.get(k).move.x = 0;
      objects.get(k).move.y = 0;
    }*/
    if(keyPressed){
      objects.clear();
      fighter = new Fighter();
      enemy = new Enemy();
      objects.add(fighter);
      objects.add(enemy);
      make_enemy = true;
      frameCount = 1;
      mode = 0;
        
    }

  }
  
  
  //fighter.Draw();
} 

void keyPressed() {
  if(key == ' '){ //空白をシングルクオーテーション「’」で囲む 
      if(big_bullet == true){
        objects.add(new Bullet(fighter, true)); //スペースキーが押されたらBulletを作って表示 
        //Counter++;
        bullet_sound.trigger();
        big_bullet = false;
      }
      else{
        objects.add(new Bullet(fighter)); //スペースキーが押されたらBulletを作って表示 
        //Counter++;
        bullet_sound.trigger();
      }
  }
  else if(keyCode == LEFT){
    fighter.moveDirection = -1;
  }
  else if(keyCode == RIGHT){
    fighter.moveDirection = 1;
  }
  
}
void keyReleased() {
  fighter.moveDirection = 0;
}

void Collision(ArrayList<DisplayObject> objects, int time){
  for(int i = 0; i < objects.size(); i++){
    for(int j = 0; j < objects.size(); j++){
      //iがbullet, jがenemyの時
      if((objects.get(i).syurui == 1 || objects.get(i).syurui == 5)&& objects.get(j).syurui == 2){
        Enemy e = (Enemy)objects.get(j);
        Bullet b = (Bullet)objects.get(i);
        //bulletとenemyが当たったら
        if((e.position.x - b.radius <= b.position.x && 
            b.position.x <= e.position.x + e.size_x + b.radius) &&
           (e.position.y + e.size_y + b.radius >= b.position.y && 
            b.position.y >= e.position.y - b.radius)){
          objects.get(j).HP -= objects.get(i).HP;
          if(b.syurui == 1){
            objects.get(i).HP--;
          }
          damage_sound.trigger(); //ダメージ音再生
          score++;
        }
      }
      //iがenemyのbullet, jがfighterの時
      if(objects.get(i).syurui == 3 && objects.get(j).syurui == 0){
        Fighter f = (Fighter)objects.get(j);
        Bullet b = (Bullet)objects.get(i);
        //bulletとfighterが当たったら
        if((f.position.x - b.radius <= b.position.x && 
            b.position.x <= f.position.x + f.size_x + b.radius) &&
           (f.position.y + f.size_y + b.radius >= b.position.y && 
            b.position.y >= f.position.y - b.radius)){
          if(frameCount >= 1800){
            if(frameCount - time >= 120){ //無敵時間の間はダメージ0
              objects.get(j).HP -= objects.get(i).HP;
            }
          }
          else{
            if(frameCount - time >= 60){ //無敵時間の間はダメージ0
              objects.get(j).HP -= objects.get(i).HP;
            }
          }
          objects.get(i).HP--;
          damage_sound.trigger(); //ダメージ音再生
        }
      }
      //iがfighter, jがenemyの時
      if(objects.get(i).syurui == 0 && objects.get(j).syurui == 2){
        Enemy e = (Enemy)objects.get(j);
        Fighter f = (Fighter)objects.get(i);
        //fighterとenemyが当たったら
        if((e.position.x - f.size_x <= f.position.x && 
            f.position.x <= e.position.x + e.size_x) &&
           (e.position.y + e.size_y >= f.position.y && 
            f.position.y + f.size_y <= e.position.y)){
          if(frameCount >= 1800){
            if(frameCount - time >= 120){ //無敵時間の間はダメージ0
              objects.get(i).HP -= objects.get(j).HP;
            }
          }
          else{
            if(frameCount - time >= 60){ //無敵時間の間はダメージ0
              objects.get(i).HP -= objects.get(j).HP;
            }
          }
          
          objects.get(j).HP = 0;
        }
      }
      //iがattacitem, jがfighterの時
      if(objects.get(i).syurui == 4 && objects.get(j).syurui == 0){
        Fighter f = (Fighter)objects.get(j);
        AttackItem ai = (AttackItem)objects.get(i);
        //bulletとfighterが当たったら
        if((f.position.x - ai.radius <= ai.position.x && 
            ai.position.x <= f.position.x + f.size_x + ai.radius) &&
           (f.position.y + f.size_y + ai.radius >= ai.position.y && 
            ai.position.y >= f.position.y - ai.radius)){
          objects.get(i).HP--;
        }
      }      
      //iがdiffenceitem, jがfighterの時
      if(objects.get(i).syurui == 6 && objects.get(j).syurui == 0){
        Fighter f = (Fighter)objects.get(j);
        DiffenceItem di = (DiffenceItem)objects.get(i);
        //bulletとfighterが当たったら
        if((f.position.x - di.radius <= di.position.x && 
            di.position.x <= f.position.x + f.size_x + di.radius) &&
           (f.position.y + f.size_y + di.radius >= di.position.y && 
            di.position.y >= f.position.y - di.radius)){
          objects.get(i).HP--;
          muteki_time = frameCount;
        }
      }
      //iがrecoveritem, jがfighterの時
      if(objects.get(i).syurui == 7 && objects.get(j).syurui == 0){
        Fighter f = (Fighter)objects.get(j);
        RecoverItem ri = (RecoverItem)objects.get(i);
        //bulletとfighterが当たったら
        if((f.position.x - ri.radius <= ri.position.x && 
            ri.position.x <= f.position.x + f.size_x + ri.radius) &&
           (f.position.y + f.size_y + ri.radius >= ri.position.y && 
            ri.position.y >= f.position.y - ri.radius)){
          objects.get(j).HP += objects.get(i).HP;
          objects.get(i).HP = 0;
          if(objects.get(j).HP >= 20){
            objects.get(j).HP = 20;
          }
        }
      }
    }
  }
  for(int i = 0; i < objects.size(); i++) {
    if(objects.get(i).HP <= 0) {
      //enemyが消える時だけ音を発生
      if(objects.get(i).syurui == 2){
        explosion_sound.trigger();
        objects.remove(i);
        i--;
      }
      else if(objects.get(i).syurui == 0){ //fighterが消える時
        mode = 2;
        
      }
      else if(objects.get(i).syurui == 4){ //attackitem
        objects.remove(i);
        i--;
        big_bullet = true;
      }
      else if(objects.get(i).syurui == 6){ //diffenceitem
        objects.remove(i);
        i--;
        muteki_time = frameCount;
      }
      else{ //bulletが消える時
        objects.remove(i);
        i--;
      }
      
    }
    
  }
}


 
