//Visualizar el DOM(Document Object Model) en la consola
//console.log(document);

const videojuego = {
    nombre: "Halo",
    imagen: "https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/976730/header.jpg?t=1740682623",
    descripcion: `Halo es una aclamada franquicia de videojuegos de disparos en primera persona (FPS) 
        de ciencia ficción, creada por Bungie y desarrollada actualmente por 343 Industries para 
        Xbox y PC, centrada en el supersoldado Jefe Maestro y su IA, Cortana.`,
    genero: ["Shooter"],
}

const halo = document.getElementById("halo");

console.log(halo);

halo.onclick = () => {
    console.log("click en halo");
    halo.innerHTML = `<p class='is-size-3'>${videojuego.nombre}</p>
        <p>${videojuego.descripcion}</p>
        <span class="tag">${videojuego.genero[0]}</span>
        `;
}