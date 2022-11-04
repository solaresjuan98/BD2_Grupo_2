const { response, json } = require("express")
const { queries } = require("../db/queries");




const query1_a = async (req, res = response) => {

    try {

        let result = await queries.query1a()

        return res.status(200).json({
            message: "Success",
            isCorrect: true,
            result
        })
    } catch (error) {

        return res.status(400).json({
            message: "Error",
            isCorrect: false,
        })
    }

}

const query1_b = async (req, res = response) => {

    try {

        let result = await queries.query1b()

        return res.status(200).json({
            message: "Success",
            isCorrect: true,
            result
        })
    } catch (error) {
        console.log(error);
        return res.status(400).json({
            message: "Error",
            isCorrect: false
        })
    }

}

const query1_c = async (req, res = response) => {

    try {

        let result = await queries.query1c()

        return res.status(200).json({
            message: "Success",
            isCorrect: true,
            result
        })
    } catch (error) {

        return res.status(400).json({
            message: "Error",
            isCorrect: false
        })
    }

}


const query_2 = async (req, res = response) => {

    try {

        let result = await queries.query2()

        return res.status(200).json({
            message: "Success",
            isCorrect: true,
            result
        })
    } catch (error) {

        return res.status(400).json({
            message: "Error",
            isCorrect: false
        })
    }

}


const query_3 = async (req, res = response) => {

    try {

        let result = await queries.query3()

        return res.status(200).json({
            message: "Success",
            isCorrect: true,
            result
        })
    } catch (error) {

        return res.status(400).json({
            message: "Error",
            isCorrect: false
        })
    }

}



const query_4 = async (req, res = response) => {

    try {

        let result = await queries.query4()

        return res.status(200).json({
            message: "Success",
            isCorrect: true,
            result
        })
    } catch (error) {

        return res.status(400).json({
            message: "Error",
            isCorrect: false
        })
    }

}



const query_5 = async (req, res = response) => {

    try {

        let result = await queries.query5()

        return res.status(200).json({
            message: "Success",
            isCorrect: true,
            result
        })
    } catch (error) {

        return res.status(400).json({
            message: "Error",
            isCorrect: false
        })
    }

}



const query_6 = async (req, res = response) => {

    try {

        let result = await queries.query6()

        return res.status(200).json({
            message: "Success",
            isCorrect: true,
            result
        })
    } catch (error) {

        return res.status(400).json({
            message: "Error",
            isCorrect: false
        })
    }

}



const query_7 = async (req, res = response) => {

    try {

        let result = await queries.query7()

        return res.status(200).json({
            message: "Success",
            isCorrect: true,
            result
        })
    } catch (error) {

        return res.status(400).json({
            message: "Error",
            isCorrect: false
        })
    }

}



const query_8 = async (req, res = response) => {

    try {

        let result = await queries.query8()

        return res.status(200).json({
            message: "Success",
            isCorrect: true,
            result
        })
    } catch (error) {

        return res.status(400).json({
            message: "Error",
            isCorrect: false
        })
    }

}






module.exports = {
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
}

