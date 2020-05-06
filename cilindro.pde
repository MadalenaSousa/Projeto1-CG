class Cilindro {
  
  int raioCilindro1, raioCilindro2, altCilindro, divisoes;
  String tipo;
  Boolean topoOn, fundoOn;
  float angCilindro;
  PShape topo, corpo, fundo;
  
  Cilindro(int raioCilindro1, int raioCilindro2, int altCilindro, int divisoes, String tipo, boolean topoOn, boolean fundoOn) {
    this.raioCilindro1 = raioCilindro1;
    this.raioCilindro2 = raioCilindro2;
    this.altCilindro = altCilindro;
    this.divisoes = divisoes;
    this.tipo = tipo;
    this.topoOn = topoOn;
    this.fundoOn = fundoOn;
    angCilindro = TWO_PI / this.divisoes;
    
    topo = createShape();
    
    topo.beginShape();
        if(tipo == "copa") {
          topo.ambient(0.25 * 255, 0.20725 * 255, 0.20725 * 255);
          topo.fill(1.0 * 255, 0.829 * 255, 0.829 * 255, 0.92 * 255);
          topo.specular(0.296648 * 255, 0.296648 * 255, 0.296648* 255);
          topo.shininess(11.264);
        } else if(tipo == "gold") {
          topo.ambient(0.24725 * 255, 0.1995 * 255, 0.0745 * 255);
          topo.fill(0.75164 * 255, 0.60648 * 255, 0.22648 * 255);
          topo.specular(0.628281 * 255, 0.555802 * 255, 0.366065 * 255);
          topo.shininess(52.2);
        } else if(tipo == "silver"){
          topo.ambient(0.19225 * 255, 0.19225 * 255, 0.19225 * 255);
          topo.fill(0.50754 * 255, 0.50754 * 255, 0.50754 * 255);
          topo.specular(0.508273 * 255, 0.508273 * 255, 0.508273 * 255);
          topo.shininess(51.2);
        }
        for(int i = 0; i < this.divisoes; i++) {
          topo.vertex(raioCilindro1 * cos(angCilindro * i), raioCilindro1 * sin(angCilindro * i), - altCilindro / 2, i, i+1);
        }
    topo.endShape(CLOSE);
    
    corpo = createShape();
    
    if(tipo == "copa") {   
      for(int i = 0; i < divisoes; i++) {
        corpo.beginShape(QUADS);
          corpo.ambient(0.25 * 255, 0.20725 * 255, 0.20725 * 255);
          corpo.fill(1.0 * 255, 0.829 * 255, 0.829 * 255, 0.92 * 255);
          corpo.specular(0.296648 * 255, 0.296648 * 255, 0.296648* 255);
          corpo.shininess(11.264);
          
          corpo.vertex(raioCilindro2 * cos(angCilindro * i), raioCilindro2 * sin(angCilindro * i), altCilindro / 2, 0, 0);
          corpo.vertex(raioCilindro2 * cos(angCilindro * (i+1)), raioCilindro2 * sin(angCilindro * (i+1)), altCilindro / 2, 0, 1);
          corpo.vertex(raioCilindro1 * cos(angCilindro * (i+1)), raioCilindro1 * sin(angCilindro * (i+1)), - altCilindro / 2, 1, 1);
          corpo.vertex(raioCilindro1 * cos(angCilindro * i), raioCilindro1 * sin(angCilindro * i), - altCilindro / 2, 1, 0);
        corpo.endShape();
      }
    } else if(tipo == "gold") {
      for(int i = 0; i < this.divisoes; i++) {
        corpo.beginShape(QUADS);
          corpo.ambient(0.24725 * 255, 0.1995 * 255, 0.0745 * 255);
          corpo.fill(0.75164 * 255, 0.60648 * 255, 0.22648 * 255);
          corpo.specular(0.628281 * 255, 0.555802 * 255, 0.366065 * 255);
          corpo.shininess(52.2);
      
          corpo.vertex(raioCilindro2 * cos(angCilindro * i), raioCilindro2 * sin(angCilindro * i), altCilindro / 2, 0, 0);
          corpo.vertex(raioCilindro2 * cos(angCilindro * (i+1)), raioCilindro2 * sin(angCilindro * (i+1)), altCilindro / 2, 0, 1);
          corpo.vertex(raioCilindro1 * cos(angCilindro * (i+1)), raioCilindro1 * sin(angCilindro * (i+1)), - altCilindro / 2, 1, 1);
          corpo.vertex(raioCilindro1 * cos(angCilindro * i), raioCilindro1 * sin(angCilindro * i), - altCilindro / 2, 1, 0);
        corpo.endShape();
      }
    } else if(tipo == "silver"){
      for(int i = 0; i < this.divisoes; i++) {
        corpo.beginShape(QUADS);
          corpo.ambient(0.19225 * 255, 0.19225 * 255, 0.19225 * 255);
          corpo.fill(0.50754 * 255, 0.50754 * 255, 0.50754 * 255);
          corpo.specular(0.508273 * 255, 0.508273 * 255, 0.508273 * 255);
          corpo.shininess(51.2);
        
          corpo.vertex(raioCilindro2 * cos(angCilindro * i), raioCilindro2 * sin(angCilindro * i), altCilindro / 2, 0, 0);
          corpo.vertex(raioCilindro2 * cos(angCilindro * (i+1)), raioCilindro2 * sin(angCilindro * (i+1)), altCilindro / 2, 0, 1);
          corpo.vertex(raioCilindro1 * cos(angCilindro * (i+1)), raioCilindro1 * sin(angCilindro * (i+1)), - altCilindro / 2, 1, 1);
          corpo.vertex(raioCilindro1 * cos(angCilindro * i), raioCilindro1 * sin(angCilindro * i), - altCilindro / 2, 1, 0);
        corpo.endShape();
      }
    } else if(tipo == "led"){
      for(int i = 0; i < this.divisoes; i++) {
        corpo.beginShape(QUADS);
          corpo.ambient(255, 0, 255);
          corpo.fill(255, 0, 255, 100);
          corpo.specular(255, 255, 255);
          corpo.shininess(255);
          pointLight(255, 255, 255, 0, 0, i * 10);
        
          corpo.vertex(raioCilindro2 * cos(angCilindro * i), raioCilindro2 * sin(angCilindro * i), altCilindro / 2, 0, 0);
          corpo.vertex(raioCilindro2 * cos(angCilindro * (i+1)), raioCilindro2 * sin(angCilindro * (i+1)), altCilindro / 2, 0, 1);
          corpo.vertex(raioCilindro1 * cos(angCilindro * (i+1)), raioCilindro1 * sin(angCilindro * (i+1)), - altCilindro / 2, 1, 1);
          corpo.vertex(raioCilindro1 * cos(angCilindro * i), raioCilindro1 * sin(angCilindro * i), - altCilindro / 2, 1, 0);
        corpo.endShape();
      }
    }
    
    fundo = createShape();
    
    fundo.beginShape();
        if(tipo == "copa") {
          fundo.ambient(0.25 * 255, 0.20725 * 255, 0.20725 * 255);
          fundo.fill(1.0 * 255, 0.829 * 255, 0.829 * 255, 0.92 * 255);
          fundo.specular(0.296648 * 255, 0.296648 * 255, 0.296648* 255);
          fundo.shininess(11.264);
        } else if(tipo == "silver"){
          fundo.ambient(0.19225 * 255, 0.19225 * 255, 0.19225 * 255);
          fundo.fill(0.50754 * 255, 0.50754 * 255, 0.50754 * 255);
          fundo.specular(0.508273 * 255, 0.508273 * 255, 0.508273 * 255);
          fundo.shininess(51.2);
        } else if(tipo == "gold") {
          fundo.ambient(0.24725 * 255, 0.1995 * 255, 0.0745 * 255);
          fundo.fill(0.75164 * 255, 0.60648 * 255, 0.22648 * 255);
          fundo.specular(0.628281 * 255, 0.555802 * 255, 0.366065 * 255);
          fundo.shininess(52.2);
        }
        for(int i = 0; i < this.divisoes; i++) {
          fundo.vertex(raioCilindro2 * cos(angCilindro * i), raioCilindro2 * sin(angCilindro * i), altCilindro / 2, i, i+1);
        }
    fundo.endShape(CLOSE);
   
  }

  void desenhaCilindro() {    
    //topo do cilindro
    if(fundoOn){
      shape(fundo);
    }
    
    //corpo do cilindro
    shape(corpo);
    
    //fundo do cilindro
    if(topoOn) {
      shape(topo);
    }
  }
}
