console.log ("hola desde node!");

const fileSystem = require("fs");

fileSystem.writeFileSync("hola.txt", "Hola desde node!");