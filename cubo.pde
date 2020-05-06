class Cubo {
  
  int aresta;
  String tipo;
  PImage fabric;
  PShape cubo;
  
  Cubo(int aresta, String tipo) {
    this.aresta = aresta;
    this.tipo = tipo;
    fabric = loadImage("fabric.jpg");
    
    cubo = createShape();
    
    cubo.beginShape(QUADS);
      if(tipo == "blueFabric") {
        cubo.ambient(85, 132, 162);
        cubo.fill(85, 132, 162);
        cubo.specular(85, 132, 162);
        cubo.shininess(1);
        cubo.texture(fabric);
      } else if(tipo == "whiteFabric"){
        cubo.ambient(211, 143, 191);
        cubo.fill(211, 143, 191);
        cubo.specular(211, 143, 191);
        cubo.shininess(1);
        cubo.texture(fabric);
      } else if(tipo == "gold"){
        cubo.ambient(0.24725 * 255, 0.1995 * 255, 0.0745 * 255);
        cubo.fill(0.75164 * 255, 0.60648 * 255, 0.22648 * 255);
        cubo.specular(0.628281 * 255, 0.555802 * 255, 0.366065 * 255);
        cubo.shininess(52.2);
      } else if(tipo == "silver"){
        cubo.ambient(0.19225 * 255, 0.19225 * 255, 0.19225 * 255);
        cubo.fill(0.50754 * 255, 0.50754 * 255, 0.50754 * 255);
        cubo.specular(0.508273 * 255, 0.508273 * 255, 0.508273 * 255);
        cubo.shininess(51.2);
      } else if(tipo == "none") {
        cubo.ambient(181, 210, 211);
        cubo.fill(181, 210, 211);
        cubo.specular(181, 210, 211);
        cubo.shininess(1);
      }
      
      //x = -aresta/2 //trás
      cubo.vertex(-aresta/2, -aresta/2, -aresta/2, 0, 0);
      cubo.vertex(-aresta/2, -aresta/2, aresta/2, 0, 1);
      cubo.vertex(-aresta/2, aresta/2, aresta/2, 1, 1);
      cubo.vertex(-aresta/2, aresta/2, -aresta/2, 1, 0);
    
      //y = -aresta/2 //lado direito
      cubo.vertex(-aresta/2, -aresta/2, -aresta/2, 0, 0);
      cubo.vertex(-aresta/2, -aresta/2, aresta/2, 0, 1);
      cubo.vertex(aresta/2, -aresta/2, aresta/2, 1, 1);
      cubo.vertex(aresta/2, -aresta/2, -aresta/2, 1, 0);
    
      //z = -aresta/2 //fundo
      cubo.vertex(-aresta/2, -aresta/2, -aresta/2, 0, 0);
      cubo.vertex(aresta/2, -aresta/2, -aresta/2, 0, 1);
      cubo.vertex(aresta/2, aresta/2, -aresta/2, 1, 1);
      cubo.vertex(-aresta/2, aresta/2, -aresta/2, 1, 0);
    
      //x = aresta/2 //frente
      cubo.vertex(aresta/2, -aresta/2, -aresta/2, 0, 0);
      cubo.vertex(aresta/2, -aresta/2, aresta/2, 0, 1);
      cubo.vertex(aresta/2, aresta/2, aresta/2, 1, 1);
      cubo.vertex(aresta/2, aresta/2, -aresta/2, 1, 0);
    
      //y = aresta/2 //lado esquerdo
      cubo.vertex(-aresta/2, aresta/2, -aresta/2, 0, 0);
      cubo.vertex(-aresta/2, aresta/2, aresta/2, 0, 1);
      cubo.vertex(aresta/2, aresta/2, aresta/2, 1, 1);
      cubo.vertex(aresta/2, aresta/2, -aresta/2, 1, 0);
    
      //z = aresta //cimo
      cubo.vertex(-aresta/2, -aresta/2, aresta/2, 0, 0);
      cubo.vertex(aresta/2, -aresta/2, aresta/2, 0, 1);
      cubo.vertex(aresta/2, aresta/2, aresta/2, 1, 1);
      cubo.vertex(-aresta/2, aresta/2, aresta/2, 1, 0);
    
    cubo.endShape();
  }
  
  void desenhaCubo() {
    shapeMode(CORNER);
    
    shape(cubo);
  }
}
