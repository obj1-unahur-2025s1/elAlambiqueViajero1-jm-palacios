object luke {
    var cantVisitas = 0
    var ultimoRecuerdo = null
    var vehiculo = alambiqueVeloz

    method cantVisitados()= cantVisitas
    method ultimoRecuerdo()= ultimoRecuerdo
    method cambioVehiculo(vehiculoNuevo) {vehiculo = vehiculoNuevo}
    method viajar(lugar) {
        if (lugar.puedeLlegar(vehiculo)){
            cantVisitas += 1
            ultimoRecuerdo = lugar.recuerdo()
            vehiculo.desgaste()
        }     
    }
}
object alambiqueVeloz {
    var combustible = 100
    const comsumoPorViaje = 10
    var patente = "AB123JK"
    
    method rapido() = true
    method puedeFuncionar() = combustible >= comsumoPorViaje
    method desgaste() { combustible -= comsumoPorViaje} 
    method patenteValida() = patente.head() == "A" 
    method cambioPatente(patenteNueva) { patente = patenteNueva}

      
}
object paris{
    method recuerdo(){return "llavero torre Eiffiel"}
    method puedeLlegar(vehiculo) = vehiculo.puedeFuncionar() 
}
object buenosAires{
    method recuerdo(){return "mate"}
    method puedeLlegar(vehiculo) = vehiculo.rapido()    
}
object bagdad{
    var recuerdo = "bidon de petroleo"

    method recuerdo() = recuerdo
    method cambioRecuerdo(recuerdoNuevo) { recuerdo = recuerdoNuevo }
    method puedeLlegar(vehiculo) = true  
}
object lasVegas{
    var homenaje = paris

    method homenaje(unLugar) { homenaje = unLugar}
    method recuerdo() = homenaje.recuerdo()
    method puedeLlegar(vehiculo) = homenaje.puedeLlegar(vehiculo)  
}
object superChatarra {
    var caniones = 10
    var municiones = 'ACME'

    method caniones() = caniones
    method puedeFuncionar() = municiones == 'ACME' and caniones.between(6, 12)
    method rapido() = municiones.size() < caniones 
    method desgaste() {
        caniones = (caniones / 2).roundUp(0)
        if (caniones < 5){
            municiones = municiones + 'Obsoleto'
        }     
    }
    method patenteValida() = municiones.take(4) == 'ACME'  
}
object antiguallaBlindada {
    var gansters = 7

    method puedeFuncionar() = gansters.odd()
    method rapido() = gansters > 6
    method desgaste() { gansters -= 1}
    method patenteValida() = true  
}
object superConvertible {
    var convertido = antiguallaBlindada

    method puedeFuncionar() = convertido.puedeFuncionar()
    method rapido() = convertido.rapido()
    method patenteValida() = convertido.patenteValida()
    method desgaste() { convertido.desgaste()}
    method convertido(vehiculo) { convertido = vehiculo}
  
}
object hurlingham {
  method puedeLlegar(vehiculo) = vehiculo.puedeFuncionar() and vehiculo.rapido() and vehiculo.patenteValida()
  method recuerdo() = "sticker de la UnaHur"  
}
object moto {
  method rapido() = true
  method puedeFuncionar() = not self.rapido()
  method desgaste() {}
  method patenteValida() = false 
}