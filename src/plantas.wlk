class Planta {

  const property anioObtencionSemilla = 0
  const property altura = 0

  method horasDeSolQueTolera()

  method esFuerte() = self.horasDeSolQueTolera() > 10

  method daNuevaSemillas() = self.esFuerte() or self.condicionAlternativa()

  method condicionAlternativa()

  method espacio()

  method resultaIdeal(parcela)

  method seAsociaBien(parcela) = parcela.puedeAsociarse(self)

}

class Menta inherits Planta {

  override method horasDeSolQueTolera() = 6

  override method condicionAlternativa() = self.altura() > 0.4

  override method espacio() = self.altura() * 3

  override method resultaIdeal(parcela) = parcela.superficie() > 6

}

class Soja inherits Planta {

  override method horasDeSolQueTolera() {
    var tolerancia
    if (self.altura() < 0.5) {
      tolerancia = 6
    } else if (self.altura().between(0.5, 1)) {
      tolerancia = 7
    } else {
      tolerancia = 9
    }
    return tolerancia
  }

  override method condicionAlternativa() = (self.anioObtencionSemilla() > 2007) and (self.altura() > 1)

  override method espacio() = self.altura() / 2

  override method resultaIdeal(parcela) = parcela.horasDeSolPorDia() == self.horasDeSolQueTolera()

}

class Quinoa inherits Planta {

  const horasDeToleranciaAlSol = 0

  override method horasDeSolQueTolera() = horasDeToleranciaAlSol

  override method condicionAlternativa() = self.anioObtencionSemilla() < 2005

  override method espacio() = 0.5

  override method resultaIdeal(parcela) = parcela.plantacion().all({ p => p.altura() <= 1.5 })

}

class SojaTransgenica inherits Soja {

  override method daNuevaSemillas() = false

  override method resultaIdeal(parcela) = parcela.cantidadMaximaDePlantas() == 1

}

class Hierbabuena inherits Menta {

  override method espacio() = super() * 2

}

