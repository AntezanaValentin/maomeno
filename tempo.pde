class Temporizador {
  int duracion;
  int ultimoEvento;

  Temporizador(int p_duracion) {
    duracion = p_duracion;
    ultimoEvento = millis();
  }

  boolean elTiempoPaso() {
    int tiempoActual = millis();
    if (tiempoActual - ultimoEvento >= duracion) {
      ultimoEvento = tiempoActual;
      return true;
    } else return false;
  }

  float tiempoPrendido() {
    return((millis() - ultimoEvento) / duracion);
  }
}
