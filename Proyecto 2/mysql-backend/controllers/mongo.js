const { response } = require("express")
const {
    mongo2,
    mongo3,
    mongo4,
    mongo5,
    mongo6,
    mongo7,
    mongo8 } = require("../db/mongo-queries");

const queryController = (query) => {
    return async (req, res = response) => {

        try {

            let result = await query();

            return res.status(200).json({
                message: "Success",
                isCorrect: true,
                result
            })
        } catch (error) {
            console.error(error);
            return res.status(400).json({
                message: "Error",
                isCorrect: false
            })
        }

    }
}

module.exports = {
     mongo1_a: queryController(mongo1a),
     mongo1_b: queryController(mongo1b),
    mongo1_c: queryController(mongo1c),
    mongo_2: queryController(mongo2),
    mongo_3: queryController(mongo3),
    mongo_4: queryController(mongo4),
    mongo_5: queryController(mongo5),
    mongo_6: queryController(mongo6),
    mongo_7: queryController(mongo7),
    mongo_8: queryController(mongo8)
}

