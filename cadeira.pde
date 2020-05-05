class Cadeira {
  
  Cubo cubo, cuboDourado;
  Cilindro perna, rodas;
  boolean roda = false;
  float angRot, angInc;
  int offsetZCadeira = 200;
  int offsetXCadeira = 100;
  int offsetYCadeira = 100;
  
  float transX;
  float transY;
  boolean turn = false;
  float angRodinha;
  float elevacao, escala;
  float angManipulo = PI/12;
  
  Cadeira(Cubo cubo, Cubo cuboDourado, Cilindro perna, Cilindro rodas) {
    this.cubo = cubo;
    this.cuboDourado = cuboDourado;
    this.perna = perna;
    this.rodas = rodas;
  }
  
  void desenhaCadeira(){
      translate(transX, transY, 0); //mover toda a cadeira

/*-----------------------------------------------------CORPO PRINCIPAL-------------------------------------------------------*/
  
  noStroke();
  fill(#AACAD8);
  pushMatrix();      
    translate(centroX, centroY, offsetZCadeira + elevacao);
      if (roda) { //rotação do corpo principal da cadeira
        angRot = angRot + 0.1;
        rotate(angRot);
      } 
      
      //fundo
      pushMatrix();
        scale(5, 5, 1);
        cubo.desenhaCubo();
      popMatrix();
    
      //costas
      pushMatrix();
         if (mousePressed) { //ativar inclinação
          if (angInc <= 0 && angInc > -PI/8) {
            angInc = angInc - PI/180;
          }
        } else {
          if (angInc <= -PI/180) {
            angInc = angInc + PI/180;
          } else {
            angInc = 0;
          }
        }
    
        translate(-offsetXCadeira, centroY, 0); //inclinação
        rotate(angInc, 0, 1, 0);
        translate(offsetXCadeira, -centroY, 0);
        
        translate(-offsetXCadeira, 0, offsetZCadeira/2);
        rotate(PI/2, 0, 1, 0);
        scale(5, 5, 1);
        cubo.desenhaCubo();
      popMatrix();
    
      //apoios
      pushMatrix();
        translate(0, offsetYCadeira, offsetZCadeira/4);
        rotate(PI/2, 1, 0, 0);
        scale(5, 3, 1);
        cubo.desenhaCubo();
      popMatrix();
    
      pushMatrix();
        translate(0, -offsetYCadeira, offsetZCadeira/4);
        rotate(PI/2, 1, 0, 0);
        scale(5, 3, 1);
        cubo.desenhaCubo();
      popMatrix();  
  popMatrix();
    
/*----------------------------------------------------PERNA--------------------------------------------------------*/
  fill(#E3C393);
  
  pushMatrix();
      translate(centroX, centroY, offsetZCadeira/2 + 10);
      
      pushMatrix();
        translate(0, 0, elevacao);
        scale(0.25, 0.25, 3);
        perna.desenhaCilindro();
      popMatrix();
      
      pushMatrix();
        scale(0.5, 0.5, 2.5);
        perna.desenhaCilindro();
      popMatrix();
  popMatrix();

/*----------------------------------------------------MANIPULO------------------------------------------------------*/
  
  pushMatrix();
      translate(centroX, centroY, offsetZCadeira - 30);
      rotateX(PI/2 + angManipulo);
      translate(0, 0, 50);
      scale(0.5, 0.2, 2.5);
      cuboDourado.desenhaCubo();
  popMatrix();
  
/*----------------------------------------------------SUB PERNAS----------------------------------------------------*/
  
  pushMatrix();
    translate(centroX, centroY, offsetZCadeira/4);
    rotate(PI/2, 1, 0, 0);
   
    pushMatrix();
      rotate(3*TWO_PI/3, 0, 1, 0);
      scale(0.5, 0.2, 5);
      cuboDourado.desenhaCubo();
    popMatrix();

    pushMatrix();
      rotate(2*TWO_PI/3, 0, 1, 0);
      scale(0.5, 0.2, 5);
      cuboDourado.desenhaCubo();
    popMatrix();

    pushMatrix();
      rotate(TWO_PI/3, 0, 1, 0);
      scale(0.5, 0.2, 5);
      cuboDourado.desenhaCubo();
    popMatrix(); 
  popMatrix();
         
/*----------------------------------------------------RODINHAS---------------------------------------------------------*/
  
  fill(#A27F4A);
  pushMatrix();
      translate(centroX, centroY, 25);
      
      for(int i = 0; i < 6; i++) {    
        pushMatrix();
          translate(120 * cos((i * TWO_PI/6) + PI/6), 120 * sin((i * TWO_PI/6) + PI/6), 0); //posicionar rodinhas
          if(turn) {
            rotateY(angRodinha); //fazer rodas rodar no Y
            rotateZ(PI/2); //virar as rodas consoante a direção
          } else {
            rotateX(angRodinha); //fazer rodas rodar no X
          }
          rotateY(PI/2);
          rodas.desenhaCilindro();
        popMatrix();
      }
    popMatrix();
  }
  
  void elevar() {
    if(keyCode == 'u' || keyCode == 'U') {
      if(elevacao < offsetZCadeira/4) {
        elevacao = elevacao + 5;
        escala = escala + 0.1;
        angManipulo = 0;
      }
    }
    
    if(keyCode == 'j' || keyCode == 'J') {
      if(elevacao > 0) {
        elevacao = elevacao - 5;
        escala = escala - 0.1;
        angManipulo = 0;
      }
    }
  }
  
  void moverManipulo() {
    if(keyCode == 'u' || keyCode == 'U' || keyCode == 'j' || keyCode == 'J') {
      angManipulo = PI/12;
    }
  }
  
  void moverRodas() {
    if(keyCode == 'W' || keyCode == 'w') {
      if(transX < width/2 - offsetXCadeira) {
        transX = transX + 5; //mover cadeira total
        angRodinha = angRodinha + 0.1; //rodar as rodas
      }
      
      turn = true; //alterar direção das rodas
    } else if(keyCode == 'S' || keyCode == 's') {
      if(transX > - (width/2 - offsetXCadeira)) {
        transX = transX - 5; //mover cadeira total
        angRodinha = angRodinha - 0.1; //rodar as rodas
      }
        
      turn = true; //alterar direção das rodas
    } 
    
    if(keyCode == 'A' || keyCode == 'a') {
      if(transY < width/2 - offsetYCadeira) {
        transY = transY + 5; //mover cadeira total
        angRodinha = angRodinha - 0.1;
      }
      
      turn = false; //alterar direção das rodas  
    } else if(keyCode == 'D' || keyCode == 'd') {
      if(transY > - (width/2 - offsetYCadeira)) {
        transY = transY - 5; //mover cadeira total
        angRodinha = angRodinha + 0.1; //rodar as rodas
      }
      
      turn = false; //alterar direção das rodas
    }  
  }
  
  void rodar() {
    if (keyCode == ENTER) {
      if (roda) {
        roda = false;
      } else {
        roda = true;
      }
    }
  }
}
