const express = require('express');
const router = express.Router();

const isAuth = require('../util/is-auth');
const canView = require('../util/can-view');
const videojuegosController = require('../controllers/videojuegos.controller');

router.get('/new', isAuth, videojuegosController.get_new);
router.get('/nuevo', isAuth, videojuegosController.get_new);
router.get('/add', isAuth, videojuegosController.get_new);
router.post('/new', isAuth, videojuegosController.post_new);
router.post('/nuevo', isAuth, videojuegosController.post_new);
router.post('/add', isAuth, videojuegosController.get_new);
router.get('/old', isAuth, videojuegosController.get_old);
router.get('/old_labs', isAuth, videojuegosController.get_old);
router.get('/:videojuego_id', isAuth, canView, videojuegosController.get_list);
router.use(isAuth, canView, videojuegosController.get_list);

module.exports = router;