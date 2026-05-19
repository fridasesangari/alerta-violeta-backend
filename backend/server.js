const express = require("express");
const cors = require("cors");
const dotenv = require("dotenv");
const pool = require("./db");

dotenv.config();

const app = express();

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
    res.send("Backend funcionando 🚀");
});


// OBTENER INCIDENTES
app.get("/incidentes", async (req, res) => {
    try {
        const result = await pool.query(
            "SELECT * FROM incidentes ORDER BY id DESC"
        );

        res.json(result.rows);

    } catch (error) {
        console.log(error);
        res.status(500).json({
            error: "Error obteniendo incidentes"
        });
    }
});


// CREAR INCIDENTE
app.post("/incidentes", async (req, res) => {

    try {

        const {
            titulo,
            descripcion,
            latitud,
            longitud
        } = req.body;

        const result = await pool.query(
            `
            INSERT INTO incidentes
            (titulo, descripcion, latitud, longitud)
            VALUES ($1, $2, $3, $4)
            RETURNING *
            `,
            [titulo, descripcion, latitud, longitud]
        );

        res.json(result.rows[0]);

    } catch (error) {

        console.log(error);

        res.status(500).json({
            error: "Error creando incidente"
        });
    }
});


const PORT = process.env.PORT || 10000;

app.listen(PORT, () => {
    console.log(`Servidor corriendo en puerto ${PORT}`);
});