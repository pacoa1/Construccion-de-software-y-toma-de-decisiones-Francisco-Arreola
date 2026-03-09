const Videojuego = require('../models/videojuego.model');

const path = require('path');

exports.get_new = (request, response, next) => {
      response.render('new', {
        isLoggedIn: request.session.isLoggedIn || '',
        username: request.session.username || '',
    });
};

exports.post_new = (request, response, next) => {
    const videojuego = new Videojuego(request.body.nombre, request.body.imagen);
     videojuego.save().then(() => {
        return response.redirect('/videojuegos');
    }).catch((error) => {
        console.log(error);
        tnext(error);
    });
};

exports.get_old = (request, response, next) => {
    response.sendFile(path.join(__dirname, '..' , 'old_labs' , 'js' , 'index.html'));
};

exports.get_list = (request, response, next) => {
    console.log(request.params.videojuego_id);
    Videojuego.fetch(request.params.videojuego_id).then(([rows, fieldData]) => {
        return response.render('list', {
            isLoggedIn: request.session.isLoggedIn || '',
            username: request.session.username || '',
            videojuegos: rows,
        });
    }).catch((error) => {
        console.log(error);
        next(error);
    });
};