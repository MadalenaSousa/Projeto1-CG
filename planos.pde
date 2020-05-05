class Planos {
  PImage wood, wallpaper, porta;
  String tipo;
  
  Planos(String tipo) {
    this.tipo = tipo;
    wood = loadImage("wood.jpg");
    wallpaper = loadImage("wallpaper.jpg");
    porta = loadImage("porta.png");
  }
  
  void desenha() {
    float totalQuadrados = 10;
    
    if(tipo == "chao") {
      beginShape(QUADS);
        ambient(152, 111, 61);
        fill(152, 111, 61);
        specular(152, 111, 61);
        shininess(100);
        texture(wood);
        for(int i = 0; i < totalQuadrados; i++) {
          for(int z = 0; z < totalQuadrados; z++) {
            vertex((xS/totalQuadrados * i), (xS/totalQuadrados * z), 0, (i/totalQuadrados), (z/totalQuadrados));
            vertex((xS/totalQuadrados * i), (xS/totalQuadrados * z) + xS/totalQuadrados, 0, (i/totalQuadrados), (z/totalQuadrados) + 1/totalQuadrados);
            vertex((xS/totalQuadrados * i) + xS/totalQuadrados, (xS/totalQuadrados * z) + xS/totalQuadrados, 0, (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados) + 1/totalQuadrados);
            vertex((xS/totalQuadrados * i) + xS/totalQuadrados, (xS/totalQuadrados * z), 0, (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados));
          }
        }
      endShape();
    } else if(tipo == "parede1") {
      beginShape(QUADS);
        ambient(152, 111, 61);
        fill(152, 111, 61);
        specular(152, 111, 61);
        shininess(100);
        texture(wallpaper);
        for(int i = 0; i < totalQuadrados; i++) {
          for(int z = 0; z < totalQuadrados; z++) {
            vertex((xS/totalQuadrados * i), 0, (xS/totalQuadrados * z), (i/totalQuadrados), (z/totalQuadrados));
            vertex((xS/totalQuadrados * i), 0, (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados), (z/totalQuadrados) + 1/totalQuadrados);
            vertex((xS/totalQuadrados * i) + xS/totalQuadrados, 0, (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados) + 1/totalQuadrados);
            vertex((xS/totalQuadrados * i) + xS/totalQuadrados, 0, (xS/totalQuadrados * z), (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados));
          }
        }
      endShape();
    } else if(tipo == "parede2") {
      beginShape(QUADS);
        ambient(152, 111, 61);
        fill(152, 111, 61);
        specular(152, 111, 61);
        shininess(100);
        texture(wallpaper);
        for(int i = 0; i < totalQuadrados; i++) {
          for(int z = 0; z < totalQuadrados; z++) {
            vertex(0, (xS/totalQuadrados * i), (xS/totalQuadrados * z), (i/totalQuadrados), (z/totalQuadrados));
            vertex(0, (xS/totalQuadrados * i), (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados), (z/totalQuadrados) + 1/totalQuadrados);
            vertex(0, (xS/totalQuadrados * i) + xS/totalQuadrados, (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados) + 1/totalQuadrados);
            vertex(0, (xS/totalQuadrados * i) + xS/totalQuadrados, (xS/totalQuadrados * z), (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados));
          }
        }
      endShape();
    } else if(tipo == "parede3") {
      beginShape(QUADS);
        ambient(152, 111, 61);
        fill(152, 111, 61);
        specular(152, 111, 61);
        shininess(100);
        texture(wallpaper);
        for(int i = 0; i < totalQuadrados; i++) {
          for(int z = 0; z < totalQuadrados; z++) {
            vertex((xS/totalQuadrados * i), xS, (xS/totalQuadrados * z), (i/totalQuadrados), (z/totalQuadrados));
            vertex((xS/totalQuadrados * i), xS, (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados), (z/totalQuadrados) + 1/totalQuadrados);
            vertex((xS/totalQuadrados * i) + xS/totalQuadrados, xS, (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados) + 1/totalQuadrados);
            vertex((xS/totalQuadrados * i) + xS/totalQuadrados, xS, (xS/totalQuadrados * z), (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados));
          }
        }
      endShape();
    } else if(tipo == "parede4") {
      beginShape(QUADS);
        ambient(152, 111, 61);
        fill(152, 111, 61);
        specular(152, 111, 61);
        shininess(100);
        texture(wallpaper);
        for(int i = 0; i < totalQuadrados; i++) {
          for(int z = 0; z < totalQuadrados; z++) {
            vertex(xS, (xS/totalQuadrados * i), (xS/totalQuadrados * z), (i/totalQuadrados), (z/totalQuadrados));
            vertex(xS, (xS/totalQuadrados * i), (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados), (z/totalQuadrados) + 1/totalQuadrados);
            vertex(xS, (xS/totalQuadrados * i) + xS/totalQuadrados, (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados) + 1/totalQuadrados);
            vertex(xS, (xS/totalQuadrados * i) + xS/totalQuadrados, (xS/totalQuadrados * z), (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados));
          }
        }
      endShape();
    } else if(tipo == "janela") {
      beginShape(QUADS);
        ambient(152, 111, 61);
        fill(152, 111, 61);
        specular(152, 111, 61);
        shininess(100);
        texture(wallpaper);
        for(int i = 0; i < totalQuadrados; i++) {
          for(int z = 0; z < totalQuadrados; z++) {
            vertex(xS, (xS/totalQuadrados * i), (xS/totalQuadrados * z), (i/totalQuadrados), (z/totalQuadrados));
            vertex(xS, (xS/totalQuadrados * i), (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados), (z/totalQuadrados) + 1/totalQuadrados);
            vertex(xS, (xS/totalQuadrados * i) + xS/totalQuadrados, (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados) + 1/totalQuadrados);
            vertex(xS, (xS/totalQuadrados * i) + xS/totalQuadrados, (xS/totalQuadrados * z), (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados));
          }
        }
      endShape();
    } else if(tipo == "porta") {
      beginShape(QUADS);
        ambient(152, 111, 61);
        fill(152, 111, 61);
        specular(152, 111, 61);
        shininess(100);
        texture(porta);
        for(int i = 0; i < totalQuadrados; i++) {
          for(int z = 0; z < totalQuadrados; z++) {
            vertex(((xS/2)/totalQuadrados * i), xS-1, ((xS/2)/totalQuadrados * z), (i/totalQuadrados), (z/totalQuadrados));
            vertex(((xS/2)/totalQuadrados * i), xS-1, ((xS/2)/totalQuadrados * z) + (xS/2)/totalQuadrados, (i/totalQuadrados), (z/totalQuadrados) + 1/totalQuadrados);
            vertex(((xS/2)/totalQuadrados * i) + (xS/2)/totalQuadrados, xS-1, ((xS/2)/totalQuadrados * z) + (xS/2)/totalQuadrados, (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados) + 1/totalQuadrados);
            vertex(((xS/2)/totalQuadrados * i) + (xS/2)/totalQuadrados, xS-1, ((xS/2)/totalQuadrados * z), (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados));
          }
        }
      endShape();
    }
  }
}
