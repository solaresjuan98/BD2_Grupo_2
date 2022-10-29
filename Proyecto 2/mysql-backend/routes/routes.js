
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

const appRouter = Router();


appRouter.get('/queries/1a', query1_a);
appRouter.get('/queries/1b', query1_b);
appRouter.get('/queries/1c', query1_c);
appRouter.get('/queries/2', query_2);
appRouter.get('/queries/3', query_3);
appRouter.get('/queries/4', query_4);
appRouter.get('/queries/5', query_5);
appRouter.get('/queries/6', query_6);
appRouter.get('/queries/7', query_7);
appRouter.get('/queries/8', query_8);




module.exports = appRouter;