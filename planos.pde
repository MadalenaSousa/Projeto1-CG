class Planos {
  PImage wood, wallpaper, porta, tapeteTexture;
  String tipo;
  PShape chao, parede1, parede2, parede3, parede4, tapete;
  float totalQuadrados = 10;
  
  Planos(String tipo) {
    this.tipo = tipo;
    wood = loadImage("wood.jpg");
    wallpaper = loadImage("wallpaper.jpg");
    porta = loadImage("porta.png");
    tapeteTexture = loadImage("tapete.jpg");
    
    chao = createShape();
    
    chao.beginShape(QUADS);
      chao.ambient(72, 40, 7);
      chao.fill(72, 40, 7);
      chao.specular(72, 40, 7);
      chao.shininess(1);
      chao.texture(wood);
      for(int i = 0; i < totalQuadrados; i++) {
        for(int z = 0; z < totalQuadrados; z++) {
          chao.vertex((xS/totalQuadrados * i), (xS/totalQuadrados * z), 0, (i/totalQuadrados), (z/totalQuadrados));
          chao.vertex((xS/totalQuadrados * i), (xS/totalQuadrados * z) + xS/totalQuadrados, 0, (i/totalQuadrados), (z/totalQuadrados) + 1/totalQuadrados);
          chao.vertex((xS/totalQuadrados * i) + xS/totalQuadrados, (xS/totalQuadrados * z) + xS/totalQuadrados, 0, (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados) + 1/totalQuadrados);
          chao.vertex((xS/totalQuadrados * i) + xS/totalQuadrados, (xS/totalQuadrados * z), 0, (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados));
        }
      }
    chao.endShape();
    
    tapete = createShape();

    tapete.beginShape(QUADS);
      tapete.texture(tapeteTexture);
      for(int i = 0; i < totalQuadrados; i++) {
        for(int z = 0; z < totalQuadrados; z++) {
          tapete.vertex((xS/totalQuadrados * i), (xS/totalQuadrados * z), 0, (i/totalQuadrados), (z/totalQuadrados));
          tapete.vertex((xS/totalQuadrados * i), (xS/totalQuadrados * z) + xS/totalQuadrados, 0, (i/totalQuadrados), (z/totalQuadrados) + 1/totalQuadrados);
          tapete.vertex((xS/totalQuadrados * i) + xS/totalQuadrados, (xS/totalQuadrados * z) + xS/totalQuadrados, 0, (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados) + 1/totalQuadrados);
          tapete.vertex((xS/totalQuadrados * i) + xS/totalQuadrados, (xS/totalQuadrados * z), 0, (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados));
        }
      }
    tapete.endShape();
    
    //lado esquerdo da cadeira //eixo XX
    parede1 = createShape();
    
    parede1.beginShape(QUADS);
      parede1.ambient(255, 255, 255);
      parede1.fill(255, 255, 255);
      parede1.specular(255, 255, 255);
      parede1.shininess(1);
      parede1.texture(wallpaper);
      for(int i = 0; i < totalQuadrados; i++) {
        for(int z = 0; z < totalQuadrados; z++) {
          parede1.vertex((xS/totalQuadrados * i), 0, (xS/totalQuadrados * z), (i/totalQuadrados), (z/totalQuadrados));
          parede1.vertex((xS/totalQuadrados * i), 0, (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados), (z/totalQuadrados) + 1/totalQuadrados);
          parede1.vertex((xS/totalQuadrados * i) + xS/totalQuadrados, 0, (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados) + 1/totalQuadrados);
          parede1.vertex((xS/totalQuadrados * i) + xS/totalQuadrados, 0, (xS/totalQuadrados * z), (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados));
        }
      }
    parede1.endShape();
    
    //atrás da cadeira //eixo YY
    parede2 = createShape();

    parede2.beginShape(QUADS);
      parede2.ambient(255, 255, 255);
      parede2.fill(255, 255, 255);
      parede2.specular(255, 255, 255);
      parede2.shininess(1);
      parede2.texture(wallpaper);
      for(int i = 0; i < totalQuadrados; i++) {
        for(int z = 0; z < totalQuadrados; z++) {
          parede2.vertex(0, (xS/totalQuadrados * i), (xS/totalQuadrados * z), (i/totalQuadrados), (z/totalQuadrados));
          parede2.vertex(0, (xS/totalQuadrados * i), (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados), (z/totalQuadrados) + 1/totalQuadrados);
          parede2.vertex(0, (xS/totalQuadrados * i) + xS/totalQuadrados, (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados) + 1/totalQuadrados);
          parede2.vertex(0, (xS/totalQuadrados * i) + xS/totalQuadrados, (xS/totalQuadrados * z), (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados));
        }
      }
    parede2.endShape();
    
    //lado direito da cadeira
    parede3 = createShape();
    
    parede3.beginShape(QUADS);
      parede3.ambient(255, 255, 255);
      parede3.fill(255, 255, 255);
      parede3.specular(255, 255, 255);
      parede3.shininess(1);
      parede3.texture(wallpaper);
      for(int i = 0; i < totalQuadrados; i++) {
        for(int z = 0; z < totalQuadrados; z++) {
          parede3.vertex((xS/totalQuadrados * i), xS, (xS/totalQuadrados * z), (i/totalQuadrados), (z/totalQuadrados));
          parede3.vertex((xS/totalQuadrados * i), xS, (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados), (z/totalQuadrados) + 1/totalQuadrados);
          parede3.vertex((xS/totalQuadrados * i) + xS/totalQuadrados, xS, (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados) + 1/totalQuadrados);
          parede3.vertex((xS/totalQuadrados * i) + xS/totalQuadrados, xS, (xS/totalQuadrados * z), (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados));
        }
      }
    parede3.endShape();
    
    //frente da cadeira
    parede4 = createShape();
    
    parede4.beginShape(QUADS);
      parede4.ambient(255, 255, 255);
      parede4.fill(255, 255, 255);
      parede4.specular(255, 255, 255);
      parede4.shininess(1);
      parede4.texture(wallpaper);
      for(int i = 0; i < totalQuadrados; i++) {
        for(int z = 0; z < totalQuadrados; z++) {
          parede4.vertex(xS, (xS/totalQuadrados * i), (xS/totalQuadrados * z), (i/totalQuadrados), (z/totalQuadrados));
          parede4.vertex(xS, (xS/totalQuadrados * i), (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados), (z/totalQuadrados) + 1/totalQuadrados);
          parede4.vertex(xS, (xS/totalQuadrados * i) + xS/totalQuadrados, (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados) + 1/totalQuadrados);
          parede4.vertex(xS, (xS/totalQuadrados * i) + xS/totalQuadrados, (xS/totalQuadrados * z), (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados));
        }
      }
    parede4.endShape();
  }
  
  void desenha() {
    if(tipo == "chao") {
      shape(chao);
    } else if(tipo == "parede1") {
      shape(parede1);
    } else if(tipo == "parede2") {
      shape(parede2);
    } else if(tipo == "parede3") {
      shape(parede3);
    } else if(tipo == "parede4") {
      shape(parede4);
    } else if(tipo == "tapete") {
      pushMatrix();
        scale(0.6, 0.8, 1);
        translate(centroX * 0.4, centroY * 0.2, 1);
        shape(tapete);
      popMatrix();
    }
  } 
}
