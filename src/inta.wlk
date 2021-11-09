import plantas.*
import parcelas.*

object inta {

  const parcelas = []

  method agregarParcela(parcela) {
    parcelas.add(parcela)
  }

  method totalDePlantas() = parcelas.sum({ p => p.cantidadDePlantas() })

  method cantidadDeParcelas() = parcelas.size()

  method promedioPlantasPorParcela() = self.totalDePlantas() / self.cantidadDeParcelas()

  method parcelaMasAutosustentable() = parcelas.filter({ p => p.cantidadDePlantas() > 4 }).max({ p => p.cantidadDePlantasBienAsociadas() / p.cantidadDePlantas() })

}

