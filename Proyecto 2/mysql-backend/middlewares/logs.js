const { insertLog } = require('../db/redis-queries');

const viewLog = (req, res, next) => {
    const oldWrite = res.write,
      oldEnd = res.end,
      chunks = [],
      now = Date.now();
  
    res.write = function (chunk) {
      chunks.push(chunk);
      oldWrite.apply(res, arguments);
    };
  
    res.end = function (chunk, error) {
      if (chunk) chunks.push(chunk);
  
      const bodyRes = Buffer.concat(chunks).toString("utf8");

      const data = {
        endpoint: `[${req.method}] - ${req.url}`,
        body: `${JSON.stringify(req.body) || "{}"}`,
        response: bodyRes,
        code: res.statusCode,
        time: now
      }
      insertLog(data)
        .catch(console.error)
  
      oldEnd.apply(res, arguments);
    };
  
    next();
  };
  
  module.exports = viewLog;
  