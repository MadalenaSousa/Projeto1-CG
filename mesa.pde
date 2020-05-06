class Mesa {
  
  Cubo topo, perna1, perna2;
  
  Mesa() {
    perna1 = new Cubo(50, "none");
    perna2 = new Cubo(50, "none");
    topo = new Cubo(50, "none");
  }
  
  void desenhaMesa() {
    
    pushMatrix();
      translate(xS - (4*25), centroY, 300);
      scale(4, 12.5, 0.3);
      topo.desenhaCubo();
    popMatrix();
    
    pushMatrix();
      translate(xS - (4*25), centroY + (12*25), 6*25);
      scale(4, 0.3, 6);
      perna1.desenhaCubo();
    popMatrix();
    
    pushMatrix();
      translate(xS - (4*25), centroY - (12*25), 6*25);
      scale(4, 0.3, 6);
      perna2.desenhaCubo();
    popMatrix();
    
  }
}
