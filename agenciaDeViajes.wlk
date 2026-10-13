class Pack {
    const dias
    const precio
    const cordinador
    const benEspeciales = []

    method esPackPremium() {
    }

    method valorTotal() = precio + benEspeciales.filter({b => b.esVigente()}).map({b => b.costo()}).sum()
}

class Nacionales inherits Pack {
    const provincia
    const actividades = []

    override method esPackPremium() = dias > 10 and cordinador.esAltamenteCalificado()

}

class Internacionales inherits Pack {
    const pais
    const escalas
    const esDeInteres
    const recargo = (precio + benEspeciales.filter({b => b.esVigente()}).map({b => b.costo()}).sum()) * 0.20

    override method esPackPremium() = esDeInteres and dias > 20 and escalas == 0
    override method valorTotal() = super() + recargo
}

class Provinciales inherits Nacionales {
    const ciudades
    const recargo = (precio + benEspeciales.filter({b => b.esVigente()}).map({b => b.costo()}).sum()) * 0.05

    override method esPackPremium() = actividades.size() >= 4 and ciudades > 5 and benEspeciales.filter({b => b.esVigente()}).size() > 3
    override method valorTotal() = if (self.esPackPremium()) super() + recargo else super()

}