class Carta {
  PVector pos;
  PVector tam;
  int lvl;
  Carta(int i) {
    pos = new PVector(100 * i, 0);
    tam = new PVector(100, 100);
    lvl = i;
  }

  void mostrar() {
    fill(92, 51, 10);
    rect(pos.x + 10, pos.y + 10, tam.x - 20, tam.y - 20);
  }
}
