class Chao {
  PImage wood;
  String textura;
  
  Chao(String textura) {
    this.textura = textura;
    wood = loadImage("wood.jpg");
  }
  
  void desenhaChao() {
    //stroke(255);
    int totalQuadrados = 50;
    beginShape(QUADS);
      texture(wood);
      for(int i = 0; i < totalQuadrados; i++) {
        for(int z = 0; z < totalQuadrados; z++) {
          vertex((width/totalQuadrados * i), (width/totalQuadrados * z), 0, (1/totalQuadrados * i), (1/totalQuadrados * z));
          vertex((width/totalQuadrados * i), (width/totalQuadrados * z) + width/totalQuadrados, 0, (1/totalQuadrados * i), (1/totalQuadrados * z) + 1/totalQuadrados);
          vertex((width/totalQuadrados * i) + width/totalQuadrados, (width/totalQuadrados * z) + width/totalQuadrados, 0, (1/totalQuadrados * i) + 1/totalQuadrados, (1/totalQuadrados * z) + 1/totalQuadrados);
          vertex((width/totalQuadrados * i) + width/totalQuadrados, (width/totalQuadrados * z), 0, (1/totalQuadrados * i) + 1/totalQuadrados, (1/totalQuadrados * z));
        }
      }
      
      /*vertex(0, 0, 0, 0, 0);
      vertex(0, width, 0, 0, 1);
      vertex(width, width, 0, 1, 1);
      vertex(width, 0, 0, 1, 0);*/
    endShape();
  }
}
