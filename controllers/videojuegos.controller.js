const Videojuego = require('../models/videojuego.model');

const path = require('path');

exports.get_new = (request, response, next) => {
      Videojuego.getTipos().then(([tipos, fieldData]) => {
        return response.render('new', {
            editar: false,
            tipos: tipos,
            csrfToken: request.csrfToken(),
            isLoggedIn: request.session.isLoggedIn || '',
            username: request.session.username || '',
        });
    }).catch((error) => {
        console.log(error);
        next(error);
    });
};

exports.post_new = (request, response, next) => {
    const videojuego = new Videojuego(request.body.nombre, request.file.filename, request.body.tipo);
     videojuego.save().then(() => {
        return response.redirect('/videojuegos');
    }).catch((error) => {
        console.log(error);
        next(error);
    });
};

exports.get_old = (request, response, next) => {
    response.sendFile(path.join(__dirname, '..' , 'old_labs' , 'js' , 'index.html'));
};

exports.get_list = (request, response, next) => { 
    Videojuego.fetch(request.params.videojuego_id).then(([rows, fieldData]) => {
        console.log(rows);
        return response.render('list', {
            privilegios: request.session.privilegios || [],
            isLoggedIn: request.session.isLoggedIn || '',
            username: request.session.username || '',
            videojuegos: rows,
        });
    }).catch((error) => {
        console.log(error);
        next(error);
    });
    
};

exports.get_edit = (request, response, next) => {
    Videojuego.getTipos().then(([tipos, fieldData]) => {
        Videojuego.fetchOne(request.params.videojuego_id).then(([videojuegos, fieldData]) => {

            return response.render('new', {
                editar: true,
                videojuego: videojuegos[0],
                tipos: tipos,
                csrfToken: request.csrfToken(),
                isLoggedIn: request.session.isLoggedIn || '',
                username: request.session.username || '',
            });
        }).catch((errorFetchOne) => {
            console.log(errorFetchOne);
            next(errorFetchOne);
        });
    }).catch((error) => {
        console.log(error);
        next(error);
    });
};

exports.post_edit = (request, response, next) => {
    Videojuego.edit(request.body.id, request.body.nombre, request.body.imagen, request.body.tipo)
        .then(() => {
            return response.redirect(`/videojuegos/${request.body.id}`);
        }).catch((error) => {
            console.log(error);
            next(error);
        });
};