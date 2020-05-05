class Cilindro {
  
  int raioCilindro1, raioCilindro2, altCilindro, divisoes;
  String tipo;
  Boolean topo, fundo;
  
  Cilindro(int raioCilindro1, int raioCilindro2, int altCilindro, int divisoes, String tipo, boolean topo, boolean fundo) {
    this.raioCilindro1 = raioCilindro1;
    this.raioCilindro2 = raioCilindro2;
    this.altCilindro = altCilindro;
    this.divisoes = divisoes;
    this.tipo = tipo;
    this.topo = topo;
    this.fundo = fundo;
  }

  void desenhaCilindro() {
    float angCilindro = TWO_PI / divisoes;
    fill(255);
 
  //topo do cilindro
  if(fundo){
    beginShape();
      for(int i = 0; i < divisoes; i++) {
        if(tipo == "copa") {
          ambient(0.25 * 255, 0.20725 * 255, 0.20725 * 255);
          fill(1.0 * 255, 0.829 * 255, 0.829 * 255, 0.92 * 255);
          specular(0.296648 * 255, 0.296648 * 255, 0.296648* 255);
          shininess(11.264);
        } else if(tipo == "silver"){
          ambient(0.19225 * 255, 0.19225 * 255, 0.19225 * 255);
          fill(0.50754 * 255, 0.50754 * 255, 0.50754 * 255);
          specular(0.508273 * 255, 0.508273 * 255, 0.508273 * 255);
          shininess(51.2);
        } else if(tipo == "gold") {
          ambient(0.24725 * 255, 0.1995 * 255, 0.0745 * 255);
          fill(0.75164 * 255, 0.60648 * 255, 0.22648 * 255);
          specular(0.628281 * 255, 0.555802 * 255, 0.366065 * 255);
          shininess(52.2);
        }
        vertex(raioCilindro2 * cos(angCilindro * i), raioCilindro2 * sin(angCilindro * i), altCilindro / 2, i, i+1);
      }
    endShape(CLOSE);
  }
  
/*------------------------------------------------------------------------------------------------------------------*/
  
  //corpo do cilindro
  for(int i = 0; i < divisoes; i++) {
    beginShape(QUADS);
      if(tipo == "copa") {
        ambient(0.25 * 255, 0.20725 * 255, 0.20725 * 255);
        fill(1.0 * 255, 0.829 * 255, 0.829 * 255, 0.92 * 255);
        specular(0.296648 * 255, 0.296648 * 255, 0.296648* 255);
        shininess(11.264);  
      } else if(tipo == "gold") {
        ambient(0.24725 * 255, 0.1995 * 255, 0.0745 * 255);
        fill(0.75164 * 255, 0.60648 * 255, 0.22648 * 255);
        specular(0.628281 * 255, 0.555802 * 255, 0.366065 * 255);
        shininess(52.2);
      } else if(tipo == "silver"){
        ambient(0.19225 * 255, 0.19225 * 255, 0.19225 * 255);
        fill(0.50754 * 255, 0.50754 * 255, 0.50754 * 255);
        specular(0.508273 * 255, 0.508273 * 255, 0.508273 * 255);
        shininess(51.2);
      }
      vertex(raioCilindro2 * cos(angCilindro * i), raioCilindro2 * sin(angCilindro * i), altCilindro / 2, 0, 0);
      vertex(raioCilindro2 * cos(angCilindro * (i+1)), raioCilindro2 * sin(angCilindro * (i+1)), altCilindro / 2, 0, 1);
      vertex(raioCilindro1 * cos(angCilindro * (i+1)), raioCilindro1 * sin(angCilindro * (i+1)), - altCilindro / 2, 1, 1);
      vertex(raioCilindro1 * cos(angCilindro * i), raioCilindro1 * sin(angCilindro * i), - altCilindro / 2, 1, 0);
    endShape();
  }
  
/*------------------------------------------------------------------------------------------------------------------*/
  
  //fundo do cilindro
  if(topo) {
    beginShape();
      for(int i = 0; i < divisoes; i++) {
        if(tipo == "copa") {
          ambient(0.25 * 255, 0.20725 * 255, 0.20725 * 255);
          fill(1.0 * 255, 0.829 * 255, 0.829 * 255, 0.92 * 255);
          specular(0.296648 * 255, 0.296648 * 255, 0.296648* 255);
          shininess(11.264);
        } else if(tipo == "gold") {
          ambient(0.24725 * 255, 0.1995 * 255, 0.0745 * 255);
          fill(0.75164 * 255, 0.60648 * 255, 0.22648 * 255);
          specular(0.628281 * 255, 0.555802 * 255, 0.366065 * 255);
          shininess(52.2);
        } else if(tipo == "silver"){
          ambient(0.19225 * 255, 0.19225 * 255, 0.19225 * 255);
          fill(0.50754 * 255, 0.50754 * 255, 0.50754 * 255);
          specular(0.508273 * 255, 0.508273 * 255, 0.508273 * 255);
          shininess(51.2);
        }
        vertex(raioCilindro1 * cos(angCilindro * i), raioCilindro1 * sin(angCilindro * i), - altCilindro / 2, i, i+1);
      }
    endShape(CLOSE);
  }
  }
}
