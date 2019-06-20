import UIKit

//funcion sin retorno
func NumeroAlCuadrado(numero:Int){
    let resultado = numero*numero
    print("El cuadrado de \(numero) es \(resultado)")
}

func NumeroAlCubo(_ numero:Int){
    let resultado = pow(Double(numero), 3)
    print("El cubo de \(numero) es \(resultado)")
}

//function con retorno
func esPar(numero:Int)->Bool{
    if numero % 2 == 0 {
        return true
    }else{
        return false
    }
}

//Llamada a funciones
if esPar(numero:3){
    NumeroAlCuadrado(numero: 2)
}else{
    NumeroAlCubo(3)
}
