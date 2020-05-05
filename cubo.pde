class Cubo {
  
  int aresta;
  String tipo;
  PImage fabric;
  
  Cubo(int aresta, String tipo) {
    this.aresta = aresta;
    this.tipo = tipo;
    fabric = loadImage("fabric.jpg");
  }
  
  void desenhaCubo() {
    shapeMode(CENTER);
  
    beginShape(QUADS);
    
    if(tipo == "blueFabric") {
      ambient(85, 132, 162);
      fill(85, 132, 162);
      specular(85, 132, 162);
      shininess(1);
      texture(fabric);
    } else if(tipo == "whiteFabric"){
      ambient(211, 143, 191);
      fill(211, 143, 191);
      specular(211, 143, 191);
      shininess(1);
      texture(fabric);
    } else if(tipo == "gold"){
      ambient(0.24725 * 255, 0.1995 * 255, 0.0745 * 255);
      fill(0.75164 * 255, 0.60648 * 255, 0.22648 * 255);
      specular(0.628281 * 255, 0.555802 * 255, 0.366065 * 255);
      shininess(52.2);
    } else if(tipo == "silver"){
      ambient(0.19225 * 255, 0.19225 * 255, 0.19225 * 255);
      fill(0.50754 * 255, 0.50754 * 255, 0.50754 * 255);
      specular(0.508273 * 255, 0.508273 * 255, 0.508273 * 255);
      shininess(51.2);
    } else if(tipo == "none") {
      ambient(181, 210, 211);
      fill(181, 210, 211);
      specular(181, 210, 211);
      shininess(1);
    }
    
    //x = -aresta/2 //trás
    vertex(-aresta/2, -aresta/2, -aresta/2, 0, 0);
    vertex(-aresta/2, -aresta/2, aresta/2, 0, 1);
    vertex(-aresta/2, aresta/2, aresta/2, 1, 1);
    vertex(-aresta/2, aresta/2, -aresta/2, 1, 0);
  
    //y = -aresta/2 //lado direito
    vertex(-aresta/2, -aresta/2, -aresta/2, 0, 0);
    vertex(-aresta/2, -aresta/2, aresta/2, 0, 1);
    vertex(aresta/2, -aresta/2, aresta/2, 1, 1);
    vertex(aresta/2, -aresta/2, -aresta/2, 1, 0);
  
    //z = -aresta/2 //fundo
    vertex(-aresta/2, -aresta/2, -aresta/2, 0, 0);
    vertex(aresta/2, -aresta/2, -aresta/2, 0, 1);
    vertex(aresta/2, aresta/2, -aresta/2, 1, 1);
    vertex(-aresta/2, aresta/2, -aresta/2, 1, 0);
  
    //x = aresta/2 //frente
    vertex(aresta/2, -aresta/2, -aresta/2, 0, 0);
    vertex(aresta/2, -aresta/2, aresta/2, 0, 1);
    vertex(aresta/2, aresta/2, aresta/2, 1, 1);
    vertex(aresta/2, aresta/2, -aresta/2, 1, 0);
  
    //y = aresta/2 //lado esquerdo
    vertex(-aresta/2, aresta/2, -aresta/2, 0, 0);
    vertex(-aresta/2, aresta/2, aresta/2, 0, 1);
    vertex(aresta/2, aresta/2, aresta/2, 1, 1);
    vertex(aresta/2, aresta/2, -aresta/2, 1, 0);
  
    //z = aresta //cimo
    vertex(-aresta/2, -aresta/2, aresta/2, 0, 0);
    vertex(aresta/2, -aresta/2, aresta/2, 0, 1);
    vertex(aresta/2, aresta/2, aresta/2, 1, 1);
    vertex(-aresta/2, aresta/2, aresta/2, 1, 0);
  
    endShape();
  }
}
