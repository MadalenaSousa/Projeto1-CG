class Lampada {
  
  Cilindro copa, perna, base;
  int intensidade = 15;
  int cor[][]={
    {100,100,100},
    {255,255,0  },
    {0,  255,255},
    {255,0,  255},
  };
  int numColor = 0;
  int colorR  = 100;  
  int colorG  = 100;
  int colorB  = 100;
  boolean ligarLampada;
  PShape lightBulb;

  Lampada(Cilindro copa, Cilindro perna, Cilindro base, Boolean ligarLampada) {
    this.copa = copa;
    this.perna = perna;
    this.base = base;
    this.ligarLampada = ligarLampada;
  }
  
  void desenhaLampada(){
    /*----------------------------------------------------LUZ---------------------------------------------------------*/
    if(ligarLampada) {
      ambientLight(0, 0, 0);
      lightSpecular(colorR, colorG, colorB);
      pointLight(colorR, colorG, colorB, centroX/2, centroY/2, 550);
    }

/*------------------------------------------------------COPA----------------------------------------------------------*/

    pushMatrix();
      translate(centroX/2, centroY/2, 500);
      scale(0.25, 0.25, 1);
      copa.desenhaCilindro();
    popMatrix();

/*-----------------------------------------------------PERNA----------------------------------------------------------*/

    pushMatrix();
      translate(centroX/2, centroY/2, 250);
      scale(0.25, 0.25, 1);
      perna.desenhaCilindro();
    popMatrix();

/*------------------------------------------------------BASE----------------------------------------------------------*/

    pushMatrix();
      translate(centroX/2, centroY/2, 0);
      scale(0.25, 0.25, 0.5);
      base.desenhaCilindro();
    popMatrix();
    
/*------------------------------------------------------LAMPADA----------------------------------------------------------*/
    pushMatrix();
        ambient(245, 245, 245);
        fill(245, 245, 245, 100);
        specular(245, 245, 245);
        shininess(100);
        translate(centroX/2, centroY/2, 520);
        sphere(20);
    popMatrix();
  }
  
  void alteraIntensidade() {
    if(keyCode == '0') {
      if(numColor == 0){ //branco
        if(colorR > 0 && colorG > 0 && colorB > 0) {
          colorR = colorR - intensidade;
          colorG = colorG - intensidade;
          colorB = colorB - intensidade;
        }
      } else if(numColor == 1){ //amarelo
        if(colorR > 0 && colorG > 0 && colorB == 0) {
          colorR = colorR - intensidade;
          colorG = colorG - intensidade;
        }
      } else if(numColor == 2){ //ciano
        if(colorR == 0 && colorG > 0 && colorB > 0) {
          colorG = colorG - intensidade;
          colorB = colorB - intensidade;
        }
      } else if(numColor == 3){ //magenta
        if(colorR > 0 && colorG == 0 && colorB > 0) {
          colorR = colorR - intensidade;
          colorB = colorB - intensidade;
        } 
      }
    } else if(keyCode == '9') {
      if(numColor == 0){ //branco
        if(colorR < 255 && colorG < 255 && colorB < 255) {
          colorR = colorR + intensidade;
          colorG = colorG + intensidade;
          colorB = colorB + intensidade;
        }
      } else if(numColor == 1){ //amarelo
        if(colorR < 255 && colorG < 255 && colorB == 0) {
          colorR = colorR + intensidade;
          colorG = colorG + intensidade;
        }
      } else if(numColor == 2){ //ciano
        if(colorR == 0 && colorG < 255 && colorB < 255) {
          colorG = colorG + intensidade;
          colorB = colorB + intensidade;
        }
      } else if(numColor == 3){ //magenta
        if(colorR < 255 && colorG == 0 && colorB < 255) {
          colorR = colorR + intensidade;
          colorB = colorB + intensidade;
        }
      } 
    }
  }
  
  void alteraCor() {
    if ((key=='c') || (key=='C')) {
      numColor=(numColor+1)%4;
      colorR= cor[numColor][0];
      colorG= cor[numColor][1];
      colorB= cor[numColor][2];
    }
  }
  
  void ligar() {
    if(keyCode == 'y' || keyCode == 'Y') {
      ligarLampada = !ligarLampada;
    }
  }
}
