class Zombie {
  PVector pos;
  PVector vel;
  PVector tam;
  int vida;
  int daño;
  int desaparecer;
  Temporizador putrefaccion;

  Zombie(int i) {
    pos = new PVector(1050, 100 * i);
    vel = new PVector(1, 0);
    tam = new PVector(50, 100);
    vida = 9;
    daño = 3;
    desaparecer = 3000;
  }

  boolean dejaDeMoverse() {
    vel.x *= 0;
    putrefaccion = new Temporizador(desaparecer);
    return(putrefaccion.elTiempoPaso());
  }

  void mover() {
    pos.sub(vel);
  }

  boolean comiendo(PVector otro) {
    if (otro.x + 30 >= pos.x && otro.x <= pos.x && otro.y - 30 == pos.y)
      return true;
    else
      return false;
  }

  void mostrar() {
    fill(0, 150, 0);
    if (vida <= 0) fill(0, 150 * putrefaccion.tiempoPrendido(), 0);
    rect(pos.x, pos.y, tam.x, tam.y);
  }
}
