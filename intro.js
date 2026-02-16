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

// Alcance de las variables
{
    var minecraft = "5 estrellas";
    let halo = "4 estrellas";
}

//la variable manicraft sigue viviendo fuera del ámbito en el que fue declarada
console.log(minecraft);

//la línea lanza un error porque la variable halo, murió al terminar el ámbito en el que fue declarada
// console.log(halo);

//---------------------------------- alert, prompt, confirm

alert ("Hola gamers!");

const favorito = prompt ("¿Cuál es tu videojuego favorito?");

console.log("Tu juego favortio es: " + favorito);

const ganas_jugar = confirm("¿Tienes ganas de jugar?");

if (ganas_jugar) {
    console.log("¡A jugar!");
} else {
    console.log("¡A comer!");
}

//---------------------- funciones tradicionales

function is_precio() {
    return precio;
}

console.log(is_precio());


() => {}

const vidas = () => {
    console.log("Te quedan 3 vidas");
}

vidas (); 