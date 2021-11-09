class Parcela {

  const property ancho
  const property largo
  const property horasDeSolPorDia
  const property plantacion = []

  method superficie() = self.ancho() * self.largo()

  method cantidadMaximaDePlantas() {
    var cantidad
    if (self.ancho() > self.largo()) {
      cantidad = self.superficie() / 5
    } else {
      cantidad = (self.superficie() / 3) + self.largo()
    }
    return cantidad
  }

  method tieneComplicaciones() = plantacion.any({ p => p.horasDeSolQueTolera() < self.horasDeSolPorDia() })

  method cantidadDePlantas() = plantacion.size()

  method hayLugar() = (self.cantidadDePlantas() + 1) <= self.cantidadMaximaDePlantas()

  method excesoDeSol(planta) = self.horasDeSolPorDia() >= (planta.horasDeSolQueTolera() + 2)

  method plantar(planta) {
    if (self.hayLugar() and not self.excesoDeSol(planta)) {
      plantacion.add(planta)
    } else {
      self.error("No se puede plantar, parcela completa o mucho sol.")
    }
  }

  method puedeAsociarse(planta)

  method cantidadDePlantasBienAsociadas() = plantacion.count({ p => self.puedeAsociarse(p) })

}

class ParcelaEcologica inherits Parcela {

  override method puedeAsociarse(planta) = not self.tieneComplicaciones() and planta.resultaIdeal(self)

}

class ParcelaIndustrial inherits Parcela {

  override method puedeAsociarse(planta) = (self.cantidadDePlantas() <= 2) and planta.esFuerte()

}

