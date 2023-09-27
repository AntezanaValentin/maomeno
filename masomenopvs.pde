Baldosa [][] baldosa;
ArrayList<Zombie> zombies;
ArrayList<Planta> plantas;
ArrayList<Guisante> guisantes;
ArrayList<Sol> soles;
ArrayList<CortaPasto> cortapastos;
ArrayList<Carta> cartas;
ArrayList<Planta> plantasParaElegir;
int points = 25;


void setup() {
  size(1050, 650);
  guisantes = new ArrayList<Guisante>();
  soles = new ArrayList<Sol>();
  plantas = new ArrayList<Planta>();
  zombies = new ArrayList<Zombie>();
  cortapastos = new ArrayList<CortaPasto>();
  cartas = new ArrayList<Carta>();
  plantasParaElegir = new ArrayList<Planta>();
  baldosa = new Baldosa[9][5];



  for (int i = 0; i < 5; i++) {
    cortapastos.add(new CortaPasto(0, 100+i*100));
  }

  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 5; j++) {
      PVector celda = new PVector(i*100, j*100);
      baldosa[i][j] = new Baldosa(celda);
    }
  }
    for (Carta c : cartas) {
    for (Planta p : plantasParaElegir) {
      fill(255, 255, 255);
      text(p.costo, c.pos.x + 625, c.pos.y + 500);
    }
  }
}

void draw() {
  background(0);
  sistBaldosas();
  sistCortapastos();
  creaSolesyGuisantes();
  creaZombies();
  sistSoles();
  lasPlantasSiendoComidasPorZombie();
  colisionGuisZomb();
  cartasDisponibles();
  println(zombies.size());
}
