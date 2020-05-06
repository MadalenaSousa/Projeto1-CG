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
      } else if(tipo == "pinkFabric"){
        cubo.ambient(211, 143, 191);
        cubo.fill(211, 143, 191);
        cubo.specular(211, 143, 191);
        cubo.shininess(1);
        cubo.texture(fabric);
      } else if(tipo == "gold"){
        cubo.ambient(0.329412 * 255, 0.223529 * 255, 0.027451 * 255);
        cubo.fill(0.780392 * 255, 0.568627 * 255, 0.113725 * 255);
        cubo.specular(0.992157 * 255, 0.941176 * 255, 0.807843 * 255);
        cubo.shininess(27.8974);
      } else if(tipo == "silver"){
        cubo.ambient(0.19225 * 255, 0.19225 * 255, 0.19225 * 255);
        cubo.fill(0.50754 * 255, 0.50754 * 255, 0.50754 * 255);
        cubo.specular(0.508273 * 255, 0.508273 * 255, 0.508273 * 255);
        cubo.shininess(51.2);
      } else if(tipo == "none") {
        cubo.ambient(0, 0, 0);
        cubo.fill(0.01 * 255, 0.01 * 255, 0.01 * 255);
        cubo.specular(0.5 * 255, 0.5 * 255, 0.5 * 255);
        cubo.shininess(32.0);
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
