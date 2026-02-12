console.log("hola gamers");
console.info ("Esto es informaci[on");
console.warn("Esto es una advertencia");
console.error("Esto es un error");

//Compara valores
console.assert(1 == true);

//Compara valor y tipo de dato
console.assert(1 === true);

//----------------- variables, constantes ---------------

// Forma antigua de declarar variables, no se recomienda
var videojuego_1 = "Minecraft";

// Forma moderna de declarar variables
let videojuego_2 = 'Halo';

//Constantes:
const precio = 55;

// funciones tradicionales
function is_precio() {
    return precio;
}

console.log(is_precio());