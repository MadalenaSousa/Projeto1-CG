import processing.opengl.*;

int xS = 800;
int yS = 800;
int zS = 800;

float centroX = 400;
float centroY = 400;

boolean PERSPETIVA = false;
float angulo;
float raio = 400;

float poX = centroX + (raio * cos(angulo));
float poY = centroY + (raio * sin(angulo));
float poZ = 600;

PFont f;

boolean luzAmbiente = true;
boolean switchMetals = false;

Cubo cuboCadeira, cuboDourado;
Cilindro pernaCadeira, rodasCadeira, copaLampada, pernaLampada, baseLampada;
Cadeira cadeira;
Lampada lampada;
Chao chao;

void setup() {
  colorMode(RGB);
  size(800, 800, P3D);
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
  pernaCadeira = new Cilindro(25, 25, 50, 20, "gold", true, true);
  rodasCadeira = new Cilindro(25, 25, 25, 30, "gold", true, true);
  cadeira = new Cadeira(cuboCadeira, cuboDourado, pernaCadeira, rodasCadeira);
  
  copaLampada = new Cilindro(300, 150, 80, 20, "copa",false, false);
  pernaLampada = new Cilindro(25, 25, 500, 20, "gold", true, true);
  baseLampada = new Cilindro(500, 25, 80, 20, "gold", true, true);
  lampada = new Lampada(copaLampada, pernaLampada, baseLampada);
  
  chao = new Chao("wood");
}

void draw() {
  
  /*-------------------------CAMARA&PERSPETIVA----------------------------*/
  if (PERSPETIVA == true) {
    perspective(PI/2, width/height, 1, 5000);
  } else if (PERSPETIVA == false) {
    ortho(-width/2, width/2, -height/2, height/2, -5000, 5000);
  }

  camera(poX, poY, poZ, centroX, centroY, 0, 0, 0, -1);
  
  /*----------------------------LUZES------------------------------------*/
  if(luzAmbiente) {
    spotLight(200, 200, 200, centroX, centroY, height, 0, 0, -1, PI, 1);
    //ambientLight(200, 200, 200);
    background(250, 240, 222);
  } else {
    spotLight(30, 30, 30, centroX, centroY, height, 0, 0, -1, PI, 1);
    background(30, 30, 30);
  }
  
  /*-----------------------------OBJETOS----------------------------------*/
  pushMatrix();
  lampada.desenhaLampada();
  popMatrix();
  
  pushMatrix();
  cadeira.desenhaCadeira();
  popMatrix();
  
  chao.desenhaChao();
  
  /*-----------------------------TEXTO------------------------------------*/
  fill(255);
  textSize(16);
  textAlign(LEFT);
  pushMatrix();
    translate(625, 750, 1);
    rotateZ(-PI/2);
    text("Press ENTER to spin the chair", 0, 0, 0);
    text("Press S/W to move the chair back and forward", 0, 25, 0);
    text("Press A/D to move the chair left and right", 0, 50, 0);
    text("Press U/J to elevate the chair up and down", 0, 75, 0);
    text("Keep you mouse pressed to lean the chair", 0, 100, 0);
    text("Use the arrow keys to move the camera", 0, 125, 0);
  popMatrix();
}

void keyPressed() {
  
/*------------------------------------------------------ATIVAR PERSPETIVA----------------------------------------------------------------*/

  if (key == 'p' | key == 'P' ) {
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
  
    if(switchMetals) {
      cuboCadeira = new Cubo(50, "whiteFabric");
      cuboDourado = new Cubo(50, "silver");
      pernaCadeira = new Cilindro(25, 25, 50, 20, "silver", true, true);
      rodasCadeira = new Cilindro(25, 25, 25, 30, "silver", true, true);
      cadeira = new Cadeira(cuboCadeira, cuboDourado, pernaCadeira, rodasCadeira);
      
      pernaLampada = new Cilindro(25, 25, 500, 20, "silver", true, true);
      baseLampada = new Cilindro(500, 25, 80, 20, "silver", true, true);
      lampada = new Lampada(copaLampada, pernaLampada, baseLampada);
    } else {
      cuboCadeira = new Cubo(50, "blueFabric");
      cuboDourado = new Cubo(50, "gold");
      pernaCadeira = new Cilindro(25, 25, 50, 20, "gold", true, true);
      rodasCadeira = new Cilindro(25, 25, 25, 30, "gold", true, true);
      cadeira = new Cadeira(cuboCadeira, cuboDourado, pernaCadeira, rodasCadeira);
      
      pernaLampada = new Cilindro(25, 25, 500, 20, "gold", true, true);
      baseLampada = new Cilindro(500, 25, 80, 20, "gold", true, true);
      lampada = new Lampada(copaLampada, pernaLampada, baseLampada);
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
