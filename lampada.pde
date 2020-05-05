class Lampada {
  
  Cilindro copa, perna, base;
  int intensidade = 15;
  int cor[][]={
    {255,255,255},
    {255,0,  0  },
    {0,  255,0  },
    {0,  0,  255},
    {255,255,0  },
    {0,  255,255},
    {255,0,  255},
    {  0, 0,  0 },
  };
  int numColor = 0;
  int colorR  = 255;  
  int colorG  = 255;
  int colorB  = 255;
  boolean ligarLampada;

  Lampada(Cilindro copa, Cilindro perna, Cilindro base) {
    this.copa = copa;
    this.perna = perna;
    this.base = base;
  }
  
  void desenhaLampada(){
    /*----------------------------------------------------LAMPADA---------------------------------------------------------*/
    if(ligarLampada) {
      pointLight(colorR, colorG, colorB, centroX/2, centroY/2, 550);
    }
    pushMatrix();
      fill(220, 250, 239, 125);
      translate(centroX/2, centroY/2, 520);
      sphere(20);
    popMatrix();

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
      scale(0.25, 0.25, 1);
      base.desenhaCilindro();
    popMatrix();
  }
  
  void alteraIntensidade() {
    if(keyCode == '0') {
        if(colorR > 0 && colorG > 0 && colorB > 0) { //NÃO MUDA A INTENSIDADE QUANDO MUDO A COR DA LUZ
          colorR = colorR - intensidade;
          colorG = colorG - intensidade;
          colorB = colorB - intensidade;
        }
    } else if(keyCode == '9') {
      if(colorR < 255 && colorG < 255 && colorB < 255) {
        colorR = colorR + intensidade;
        colorG = colorG + intensidade;
        colorB = colorB + intensidade;
      }
    }
  }
  
  void alteraCor() {
    if ((key=='c') || (key=='C')) {
      numColor=(numColor+1)%8;
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
