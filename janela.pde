class Janela {
  
  PShape janela, frame;
  float totalQuadrados = 10;
  int luz;
  PImage wood;
  
  Janela(){    
    wood = loadImage("wood.jpg");
    
    luz = (hour() * 3600) + (minute() * 60) + second(); //soma dos segundos passados desde a 00:00
    
    janela = createShape();
    
    janela.beginShape(QUADS);
      janela.ambient(200, 200, 200);
      if(luz >= 0 && luz < 43200) {
        janela.emissive(map(luz, 0, 43200, 0, 255), map(luz, 0, 43200, 0, 255), map(luz, 0, 43200, 0, 255));
      } else if(luz >= 43200 && luz <= 86400) {
        janela.emissive(map(luz, 43200, 86400, 255, 0), map(luz, 43200, 86400, 255, 0), map(luz, 43200, 86400, 255, 0));
      }
      janela.specular(200, 200, 200);
      janela.shininess(1);
      for(int i = 0; i < totalQuadrados; i++) {
        for(int z = 0; z < totalQuadrados; z++) {
          janela.vertex((xS/totalQuadrados * i), xS, (xS/totalQuadrados * z), (i/totalQuadrados), (z/totalQuadrados));
          janela.vertex((xS/totalQuadrados * i), xS, (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados), (z/totalQuadrados) + 1/totalQuadrados);
          janela.vertex((xS/totalQuadrados * i) + xS/totalQuadrados, xS, (xS/totalQuadrados * z) + xS/totalQuadrados, (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados) + 1/totalQuadrados);
          janela.vertex((xS/totalQuadrados * i) + xS/totalQuadrados, xS, (xS/totalQuadrados * z), (i/totalQuadrados) + 1/totalQuadrados, (z/totalQuadrados));
        }
      }
    janela.endShape();
    
    frame = createShape();
    frame.beginShape();
      frame.ambient(103, 70, 8);
      frame.fill(103, 70, 8);
      frame.specular(103, 70, 8);
      frame.shininess(1);
      frame.texture(wood);
      
      frame.vertex(xS, yS, 0, 1, 0);
      frame.vertex(xS, yS, zS, 1, 1);
      frame.vertex(0, yS, zS, 0, 1);
      frame.vertex(0, yS, 0, 0, 0); 
      
      frame.beginContour();
        frame.vertex(100, yS, 100, 0, 0);
        frame.vertex(100, yS, zS - 100, 0, 1);
        frame.vertex(xS - 100, yS, zS - 100, 1, 1);
        frame.vertex(xS - 100, yS, 100, 1, 0);
      frame.endContour();
    frame.endShape(CLOSE);
  }
  
  void desenha(){
    if(luz >= 0 && luz < 43200) {
      directionalLight(map(luz, 0, 43200, 0, 255), map(luz, 0, 43200, 0, 255), map(luz, 0, 43200, 0, 255), 0, -1, 0);
      //println("Segundos passados: " + luz + " Mapeado: " + map(luz, 0, 43200, 0, 255));
    } else if(luz >= 43200 && luz <= 86400) {
      directionalLight(map(luz, 43200, 86400, 255, 0), map(luz, 43200, 86400, 255, 0), map(luz, 43200, 86400, 255, 0), 0, -1, 0);
      //println("Segundos passados: " + luz + " Mapeado: " + map(luz, 43200, 86400, 255, 0));
    }
    
    pushMatrix();
      translate(centroX/2 + 100, -1, 300);
      scale(0.4, 1, 0.2);
      shape(janela);
    popMatrix();
    
    pushMatrix();
      translate(centroX/2 + 100, -2, 300);
      scale(0.2, 1, 0.1);
      shape(frame);
      
      pushMatrix();
        translate(0, 0, zS);
        shape(frame);
      popMatrix();
      
      pushMatrix();
        translate(xS, 0, zS);
        shape(frame);
      popMatrix();
      
      pushMatrix();
        translate(xS, 0, 0);
        shape(frame);
      popMatrix();
    popMatrix();
  }
  
}
