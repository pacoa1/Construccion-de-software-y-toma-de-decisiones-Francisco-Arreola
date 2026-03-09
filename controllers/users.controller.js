const User = require("../models/user.model");

exports.get_signup = (request, response, next) => {
    response.render('signup', {
        username: request.session.username || '',
    });
};

exports.post_signup = (request, response, next) => {
    const usuario = new User(request.body.username, request.body.password, request.body.nombre);
    usuario.save().then(() => {
        return response.redirect('/users/login');
    }).catch((error) => {
        console.log(error);
        next(error);
    });
    
};

exports.get_login = (request, response, next) => {
    response.render('login', {
        username: request.session.username || '',
    });
};

exports.post_login = (request, response, next) => {
    request.session.username = request.body.username;
    response.redirect("/videojuegos");
};

exports.get_logout = (request, response, next) => {
    request.session.destroy(() => {
        response.redirect('/users/login'); //Este código se ejecuta cuando la sesión se elimina.
    });
};