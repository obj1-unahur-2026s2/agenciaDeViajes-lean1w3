class cordinadores {
    var cantViajes
    var estaMotivado
    const añosExperiencia
    var rol

    method cambiarRol(nuevoRol) {
        if (nuevoRol != "guia" or nuevoRol != "asistenteLogico" or nuevoRol != "acompañante") {
            self.error("no es un rol valido")
        }else {
            rol = nuevoRol
        }
    }
    method cumpleSuRol() = 
        if (rol == "guia") {
            return estaMotivado
    }   else if (rol == "asistenteLogico") {
            return cantViajes > 10
    }   else if (rol == "acompañante") {
            return añosExperiencia > 5
    }   else {
            return true
    }

    method esAltamenteCalificado() = cantViajes > 20 and self.cumpleSuRol()

}