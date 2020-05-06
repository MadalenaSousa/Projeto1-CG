class Led {
  
  Cilindro led;
  
  Led() {
    led = new Cilindro(25, 25, 500, 8, "led", false, false);
  }
  
  void desenhaLed() {
    led.desenhaCilindro();
  }
}
