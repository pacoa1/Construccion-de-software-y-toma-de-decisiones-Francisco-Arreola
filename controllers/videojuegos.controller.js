const Videojuego = require('../models/videojuego.model');

const path = require('path');

exports.get_new = (request, response, next) => {
      response.render('new', {
        username: request.session.username || '',
    });
};

exports.post_new = (request, response, next) => {
    const videojuego = new Videojuego(request.body.nombre, request.body.imagen);
    videojuego.save();
    response.redirect('/videojuegos');
};

exports.get_old = (request, response, next) => {
    response.sendFile(path.join(__dirname, '..' , 'old_labs' , 'js' , 'index.html'));
};

exports.get_list = (request, response, next) => {
   Videojuego.fetchAll().then(([rows, fieldData]) => {
        return response.render('list', {
            username: request.session.username || '',
            videojuegos: rows,
        });
    }).catch((error) => {
        console.log(error);
        throw error;
    });
};