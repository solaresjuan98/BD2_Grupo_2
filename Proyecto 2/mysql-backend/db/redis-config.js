const { Client } = require('redis-om')


const url = process.env.REDIS_URL;

let redisClient;

const createRedisClient = async () => {
    redisClient = new Client()
    try {
        await redisClient.open(url);
        console.log('Redis connected')
    } catch (error) {
        throw error;   
    }
}

if(!redisClient)
    createRedisClient();

module.exports = {
    redisClient,
    createRedisClient
}