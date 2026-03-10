const express = require('express');
const router = express.Router();

const isAuth = require('../util/is-auth');
const canView = require('../util/can-view');
const canCreate = require('../util/can-create');
const videojuegosController = require('../controllers/videojuegos.controller');

router.get('/new', isAuth, canCreate, videojuegosController.get_new);
router.get('/nuevo', isAuth, canCreate, videojuegosController.get_new);
router.get('/add', isAuth, canCreate, videojuegosController.get_new);
router.post('/new', isAuth, canCreate, videojuegosController.post_new);
router.post('/nuevo', isAuth, canCreate, videojuegosController.post_new);
router.post('/add', isAuth, canCreate, videojuegosController.get_new);
router.get('/old', isAuth, videojuegosController.get_old);
router.get('/old_labs', isAuth, videojuegosController.get_old);
router.get('/:videojuego_id', isAuth, canView, videojuegosController.get_list);
router.use(isAuth, canView, videojuegosController.get_list);

module.exports = router;