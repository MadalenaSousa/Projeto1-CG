import processing.opengl.*;

int xS = 1500;
int yS = 1500;
int zS = 1500;

float centroX = 750;
float centroY = 750;

boolean PERSPETIVA = true;
float angulo;
float raio = 750;

float poX = centroX + (raio * cos(angulo));
float poY = centroY + (raio * sin(angulo));
float poZ = 600;

PFont f;

boolean luzAmbiente = false;
boolean switchMetals = false;

int luzA = 180;

Cubo cuboCadeira, cuboDourado;
Cilindro pernaCadeira, rodasCadeira, copaLampada, pernaLampada, baseLampada;
Cadeira cadeira;
Lampada lampada;
Planos chao, parede1, parede2, parede3, parede4, porta, tapete;
Mesa mesa;
Janela janela;

void setup() {
  colorMode(RGB);
  size(1000, 1000, P3D);
  noStroke();
  frameRate(40);
  smooth();
  textureMode(NORMAL);  
  hint(ENABLE_DEPTH_SORT);

  f = createFont("Helvetica", 30, true);
  textFont(f);
  textAlign(CENTER);
  
  cuboCadeira = new Cubo(50, "blueFabric");
  cuboDourado = new Cubo(50, "gold");
  pernaCadeira = new Cilindro(25, 25, 50, 10, "gold", true, true);
  rodasCadeira = new Cilindro(25, 25, 25, 10, "gold", true, true);
  cadeira = new Cadeira(cuboCadeira, cuboDourado, pernaCadeira, rodasCadeira);
  
  copaLampada = new Cilindro(300, 150, 80, 10, "copaAzul",false, false);
  pernaLampada = new Cilindro(25, 25, 500, 5, "gold", true, true);
  baseLampada = new Cilindro(500, 25, 80, 10, "gold", true, true);
  lampada = new Lampada(copaLampada, pernaLampada, baseLampada, false);
  
  chao = new Planos("chao");
  parede1 = new Planos("parede1");
  parede2 = new Planos("parede2");
  parede3 = new Planos("parede3");
  parede4 = new Planos("parede4");
  tapete = new Planos("tapete");
  porta = new Planos("porta");
  
  mesa = new Mesa();
  
  janela = new Janela();
}

void draw() {
  
  /*-------------------------CAMARA&PERSPETIVA----------------------------*/
  if (PERSPETIVA == true) {
    perspective(PI/2, xS/yS, 1, 5000);
  } else if (PERSPETIVA == false) {
    ortho(-xS/2, yS/2, -yS/2, yS/2, -5000, 5000);
  }

  camera(poX, poY, poZ, centroX, centroY, 0, 0, 0, -1);
  
  /*----------------------------LUZES------------------------------------*/
  if(luzAmbiente) {
    ambientLight(0, 0, 0);
    lightSpecular(luzA, luzA, luzA);
    spotLight(luzA, luzA, luzA, centroX, centroY, zS, 0, 0, -1, PI, 1);
    background(250, 240, 222);
  } else {
    ambientLight(0, 0, 0);
    lightSpecular(30, 30, 30);
    spotLight(30, 30, 30, centroX, centroY, zS, 0, 0, -1, PI, 1);
    background(30, 30, 30);
  }
  
  /*-----------------------------OBJETOS----------------------------------*/
  pushMatrix();
    lampada.desenhaLampada();
  popMatrix();
  
  pushMatrix();
    janela = new Janela();
    janela.desenha();
  popMatrix();
  
  pushMatrix();
    cadeira.desenhaCadeira();
  popMatrix();
  
  pushMatrix();
    chao.desenha();
    
    parede1.desenha();
    parede2.desenha();
    parede3.desenha();
    parede4.desenha();
    
    tapete.desenha();
    
    mesa.desenhaMesa();
    
    porta.desenha();
  popMatrix();
  
  /*pushMatrix();
    desenhaEixos();
  popMatrix();*/
  
  /*-----------------------------TEXTO------------------------------------*/
  fill(255);
  textSize(24);
  textAlign(CENTER);
  pushMatrix();
    translate(xS - 2, centroY, 550);
    rotateZ(PI/2);
    rotateX(-PI/2);
    text("Press ENTER to spin the chair", 0, 0, 0);
    text("Press S/W to move the chair back and forward", 0, 25, 0);
    text("Press A/D to move the chair left and right", 0, 50, 0);
    text("Press U/J to elevate the chair up and down", 0, 75, 0);
    text("Keep you mouse pressed to lean the chair", 0, 100, 0);
    text("Use the arrow keys to move the camera", 0, 125, 0);
  popMatrix();
}

void keyPressed() {
  
  if(luzAmbiente) {
    if(key == '2') {
      if(luzA <= 200) {
        luzA = luzA + 10;
      }
    } else if(key == '1') {
      if(luzA >= 30) {
        luzA = luzA - 10;
      }
    }
  }
  
  if(key == 'z' | key == 'Z') {
    raio = raio - 10;
  }
  
/*------------------------------------------------------ATIVAR PERSPETIVA----------------------------------------------------------------*/

  if (key == 'p' | key == 'P') {
    PERSPETIVA = !PERSPETIVA;
  }
  
/*----------------------------------------------------ATIVAR ROTAÇÃO CÂMARA--------------------------------------------------------------*/

  if (keyCode == UP) {
    poZ = poZ + 10;
  }

  if (keyCode==DOWN) {
    poZ = poZ - 10;
  } 

  if (keyCode == LEFT) {
    angulo = angulo + 0.1;
  }

  if (keyCode == RIGHT) {
    angulo = angulo - 0.1;
  }

  poX = centroX + (raio * cos(angulo));
  poY = centroY + (raio * sin(angulo));
  
/*---------------------------------------------------------MOVIMENTOS DA CADEIRA--------------------------------------------------------------*/

  cadeira.rodar();
  cadeira.moverRodas();
  cadeira.elevar();

/*------------------------------------------------------LIGAR/DESLIGAR LUZ AMBIENTE------------------------------------------------------------*/

if(keyCode == 't' || keyCode == 'T'){
    luzAmbiente = !luzAmbiente;
}

/*-----------------------------------------------------------MUDAR DE MATERIAL--------------------------------------------------------------*/
  
  if(keyCode == 'm' || keyCode == 'M') {
    switchMetals = !switchMetals;
    Boolean previousLigarLampada = lampada.ligarLampada;
  
    if(switchMetals) {
      cuboCadeira = new Cubo(50, "pinkFabric");
      cuboDourado = new Cubo(50, "silver");
      pernaCadeira = new Cilindro(25, 25, 50, 20, "silver", true, true);
      rodasCadeira = new Cilindro(25, 25, 25, 30, "silver", true, true);
      cadeira = new Cadeira(cuboCadeira, cuboDourado, pernaCadeira, rodasCadeira);
      
      copaLampada = new Cilindro(300, 150, 80, 10, "copaRosa",false, false);
      pernaLampada = new Cilindro(25, 25, 500, 20, "silver", true, true);
      baseLampada = new Cilindro(500, 25, 80, 20, "silver", true, true);
      lampada = new Lampada(copaLampada, pernaLampada, baseLampada, previousLigarLampada);
    } else {
      cuboCadeira = new Cubo(50, "blueFabric");
      cuboDourado = new Cubo(50, "gold");
      pernaCadeira = new Cilindro(25, 25, 50, 20, "gold", true, true);
      rodasCadeira = new Cilindro(25, 25, 25, 30, "gold", true, true);
      cadeira = new Cadeira(cuboCadeira, cuboDourado, pernaCadeira, rodasCadeira);
      
      pernaLampada = new Cilindro(25, 25, 500, 20, "gold", true, true);
      baseLampada = new Cilindro(500, 25, 80, 20, "gold", true, true);
      lampada = new Lampada(copaLampada, pernaLampada, baseLampada, previousLigarLampada);
    }
  }
  
/*-----------------------------------------------------------ANIMAÇÕES DA LÂMPADA--------------------------------------------------------------*/
  
  lampada.ligar();
  lampada.alteraIntensidade();
  lampada.alteraCor();

}

void keyReleased() {
  
/*---------------------------------------------------------MOVIMENTO MANIPULO------------------------------------------------------------------*/
  cadeira.moverManipulo();
}

void desenhaEixos() {
  noFill();

  stroke(255, 0, 0);
  text("X", 0.25*xS, 0);
  line(0, 0, 0, xS, 0, 0);

  stroke(0, 255, 0);
  text("Y", 0, 0.25*yS);
  line(0, 0, 0, 0, yS, 0);

  stroke(0, 0, 255);
  text("Z", 0, 0.25*zS);
  line(0, 0, 0, 0, 0, zS);

  noStroke();
}
