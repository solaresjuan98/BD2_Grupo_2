
const { Router } = require('express');
const { mongo1_a, mongo1_b, mongo1_c, mongo_2, mongo_3, mongo_4, mongo_5, mongo_6, mongo_7, mongo_8 } = require('../controllers/mongo');
const viewLog = require('../middlewares/logs');

const appRouter = Router();

appRouter.get('/1a', viewLog, mongo1_a);
appRouter.get('/1b', viewLog, mongo1_b);
appRouter.get('/1c', viewLog, mongo1_c);
appRouter.get('/2', viewLog, mongo_2);
appRouter.get('/3', viewLog, mongo_3);
appRouter.get('/4', viewLog, mongo_4);
appRouter.get('/5', viewLog, mongo_5);
appRouter.get('/6', viewLog, mongo_6);
appRouter.get('/7', viewLog, mongo_7);
appRouter.get('/8', viewLog, mongo_8);


module.exports = appRouter;