
const { Router } = require('express');
const {
    query1_a,
    query1_b,
    query1_c,
    query_2,
    query_3,
    query_4,
    query_5,
    query_6,
    query_7,
    query_8
} = require('../controllers/queries.controllers');
const viewLog = require('../middlewares/logs');

const appRouter = Router();


appRouter.get('/1a', viewLog, query1_a);
appRouter.get('/1b', viewLog, query1_b);
appRouter.get('/1c', viewLog, query1_c);
appRouter.get('/2', viewLog, query_2);
appRouter.get('/3', viewLog, query_3);
appRouter.get('/4', viewLog, query_4);
appRouter.get('/5', viewLog, query_5);
appRouter.get('/6', viewLog, query_6);
appRouter.get('/7', viewLog, query_7);
appRouter.get('/8', viewLog, query_8);




module.exports = appRouter;