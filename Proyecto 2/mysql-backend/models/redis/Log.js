const { Entity, Schema } = require('redis-om')
const { redisClient } = require('../../db/redis-config')

class Log extends Entity { }

const logSchema = new Schema(Log, {
    endpoint: { type: 'string' },
    body: { type: 'string' },
    response: { type: 'string' },
    code: { type: 'number' },
    time: { type: 'date' },
})

const LogRepository = redisClient.fetchRepository(logSchema);


module.exports = LogRepository;