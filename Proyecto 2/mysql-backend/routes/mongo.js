
const { Router } = require('express');
const { mongo1_a, mongo1_b, mongo1_c, mongo_2, mongo_3, mongo_4, mongo_5, mongo_6, mongo_7, mongo_8 } = require('../controllers/mongo');

const appRouter = Router();

// appRouter.get('/1a', mongo1_a);
// appRouter.get('/1b', mongo1_b);
// appRouter.get('/1c', mongo1_c);
appRouter.get('/2', mongo_2);
appRouter.get('/3', mongo_3);
appRouter.get('/4', mongo_4);
appRouter.get('/5', mongo_5);
appRouter.get('/6', mongo_6);
appRouter.get('/7', mongo_7);
appRouter.get('/8', mongo_8);


module.exports = appRouter;