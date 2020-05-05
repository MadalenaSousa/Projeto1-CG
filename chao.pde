class Chao {
  PImage wood;
  String textura;
  
  Chao(String textura) {
    this.textura = textura;
    wood = loadImage("wood.jpg");
  }
  
  void desenhaChao() {
    float totalQuadrados = 100;
    beginShape(QUADS);
      ambient(152, 111, 61);
      fill(152, 111, 61);
      specular(152, 111, 61);
      shininess(100);
      texture(wood);
      for(int i = 0; i < totalQuadrados; i++) {
        for(int z = 0; z < totalQuadrados; z++) {
          vertex((width/totalQuadrados * i), (width/totalQuadrados * z), 0, (i/totalQuadrados), (z/totalQuadrados));
          vertex((width/totalQuadrados * i), (width/totalQuadrados * z) + width/totalQuadrados, 0, (i/totalQuadrados), (z/totalQuadrados) + 1/totalQuadrados);
          vertex((width/totalQuadrados * i) + width/totalQuadrados, (width/totalQuadrados * z) + width/totalQuadrados, 0, (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados) + 1/totalQuadrados);
          vertex((width/totalQuadrados * i) + width/totalQuadrados, (width/totalQuadrados * z), 0, (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados));
        }
      }
    endShape();
  }
}
