
const { Router } = require('express');
const { getLogs } = require('../db/redis-queries');
const viewLog = require('../middlewares/logs');

const appRouter = Router();

appRouter.get('/', viewLog, async(req, res) => {
    try {
        const resp = await getLogs();
        res.json(resp)
    } catch (error) {   
        console.error(error);
        res.json({
            error: error.message || JSON.stringify(message)
        })
    }
});


module.exports = appRouter;