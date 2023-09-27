Temporizador tempZomb = new Temporizador(4000);
Temporizador tempSol = new Temporizador(10000);




void mousePressed() {
  int mx = mouseX;
  int my = mouseY;
  int tip = int(random(1, 5));

  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 5; j++) {
      if (mx > baldosa[i][j].pos.x &&
        mx < baldosa[i][j].pos.x + baldosa[i][j].tam.x &&
        my > baldosa[i][j].pos.y &&
        my < baldosa[i][j].pos.y + baldosa[i][j].tam.y)
        if (!baldosa[i][j].plantado) {
          plantas.add(new Planta(baldosa[i][j].pos, tip));
          baldosa[i][j].plantado = true;
        }
    }
  }

  for (Sol s : soles) {
    if (mouseX <= s.pos.x + (s.r/2) &&
      mouseX >= s.pos.x - (s.r/2) &&
      mouseY <= s.pos.y + (s.r/2) &&
      mouseY >= s.pos.y - (s.r/2)) {
      s.agarrado();
    }
  }
}

void run() {
}

void creaSolesyGuisantes() {
  for (Planta p : plantas) {
    if (p.crea.elTiempoPaso() && p.type > 1) {
      for (Zombie z : zombies) {
        if (z.pos.x <= width && z.pos.y == p.pos.y - 30) guisantes.add(new Guisante(p.pos, p.type));
      }
    }
  }

  for (Planta p : plantas) {
    if (p.crea.elTiempoPaso()) {
      if (p.type < 2) soles.add(new Sol(p.pos));
    }
  }
  for (Guisante g : guisantes) {
    g.mover();
    g.mostrar();
  }
  for (Planta p : plantas) {
    p.mostrar();
  }
}

void colisionGuisZomb() {
  for (int i = guisantes.size() - 1; i >= 0; i--) {
    Guisante g = guisantes.get(i);
    if (g.pos.x - g.r/2 >= width)
      guisantes.remove(g);
  }
  for (int i = zombies.size() - 1; i >= 0; i--) {
    Zombie z = zombies.get(i);
    for (int j = guisantes.size() - 1; j >= 0; j--) {
      Guisante g = guisantes.get(j);
      if (g.pos.x >= z.pos.x && g.pos.y - 35 == z.pos.y) {
        z.vida -= g.damage;
        if (g.type == 4) z.vel.x = 0.5;
        if (z.vida <= 0) {
          z.dejaDeMoverse();
        }
        guisantes.remove(g);
      }
    }
  }
  for (int i = zombies.size() - 1; i >= 0; i--) {
    Zombie z = zombies.get(i);
    //if (z.dejaDeMoverse()) {
    //if (z.putrefaccion.elTiempoPaso()) zombies.remove(z);
    //}
  }
}

void sistSoles() {
  if (tempSol.elTiempoPaso()) {
    soles.add(new Sol());
  }
  for (Sol s : soles) {
    s.mover();
    s.mostrar();
  }
  for (int i = soles.size() - 1; i >= 0; i--) {
    Sol s = soles.get(i);
    if (s.pos.x <= 50 && s.pos.y <= 50) {
      soles.remove(s);
      points += 25;
    }
    if (s.cuantoVive.elTiempoPaso()) soles.remove(s);
  }
}

void creaZombies() {
  if (tempZomb.elTiempoPaso()) zombies.add(new Zombie(int(random(1, 6))));
  for (Zombie z : zombies) {
    z.mover();
    z.mostrar();
  }
}

void lasPlantasSiendoComidasPorZombie() {
  for (int i = plantas.size() - 1; i >= 0; i--) {
    Planta p = plantas.get(i);
    for (Zombie z : zombies) {
      if (z.comiendo(p.pos)) {
        z.vel.x = 0;
        p.vida -= z.daño;
      }
    }
    if (p.vida <= 0) plantas.remove(p);
  }
}

void sistCortapastos() {
  for (CortaPasto cyp : cortapastos) {
    for (Zombie z : zombies) {
      if (cyp.pisaPiqueteros(z.pos)) {
        z.dejaDeMoverse();
      }
    }
  }
  for (CortaPasto cp : cortapastos) {
    cp.mover();
    cp.mostrar();
  }
  for (int i = cortapastos.size() - 1; i >= 0; i--) {
    CortaPasto cp = cortapastos.get(i);
    if (cp.pos.x >= width - 50) cortapastos.remove(cp);
  }
}

void sistBaldosas() {
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 5; j++) {
      baldosa[i][j].mostrar();
    }
  }
}

void cartasDisponibles() {
  fill(139, 69, 19);
  rect(0, 0, 500, 100);
  for (int i = 1; i <= 4; i++) {
    cartas.add(new Carta(i));
  }
  for (Carta c : cartas) {
    plantasParaElegir.add(new Planta(c.pos, c.lvl));
  }

  for (Carta c : cartas) {
    c.mostrar();
  }
  for (Planta p : plantasParaElegir) {
    p.mostrar();
  }

}
