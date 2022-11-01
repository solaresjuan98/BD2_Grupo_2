const { redisClient, createRedisClient } = require('../db/redis-config')

const insertLog = async (data) => {

    if (!redisClient.isOpen()) {
        await createRedisClient();
    }
    try {
        let resp = await redisClient.execute(['SET', data.time, JSON.stringify(data)]);
        console.log(resp)
    } catch (error) {
        return [];
    } finally {
        await redisClient.close();
    }
}

const getLogs = async () => {

    if (!redisClient.isOpen()) {
        await createRedisClient();
    }
    try {
        let keys = await redisClient.execute(['KEYS', '*']);
        const promises = [];

        const regex = RegExp(/backup/)

        keys.forEach(key => {
            if (!regex.test(key))
                promises.push(redisClient.execute(['GET', key]));
        });

        const results = await Promise.all(promises);

        const data = results.map(log => {
            return JSON.parse(log);

        })
        return data
    } catch (error) {
        return [];
    } finally {
        await redisClient.close();
    }
}

module.exports = {
    insertLog,
    getLogs
}