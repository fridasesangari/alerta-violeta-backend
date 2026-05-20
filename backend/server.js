const express = require("express");
const cors = require("cors");
const dotenv = require("dotenv");
const pool = require("./db");

dotenv.config();

const app = express();

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
    res.send("Backend funcionando");
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
app.post('/incidentes', async (req, res) => {

  try {

    const {

      titulo,
      descripcion,
      categoria,
      latitud,
      longitud

    } = req.body;

    console.log(req.body);

    const result = await pool.query(

      `INSERT INTO incidentes

      (
        titulo,
        descripcion,
        categoria,
        latitud,
        longitud
      )

      VALUES ($1, $2, $3, $4, $5)

      RETURNING *`,

      [
        titulo,
        descripcion,
        categoria,
        latitud,
        longitud
      ]
    );

    res.status(201).json(result.rows[0]);

  } catch (error) {

    console.log(error);

    res.status(500).json({

      error: 'Error al crear incidente'
    });
  }
});


const PORT = process.env.PORT || 10000;

app.listen(PORT, () => {
    console.log(`Servidor corriendo en puerto ${PORT}`);

});

app.delete('/incidentes/:id', async (req, res) => {
    try {
        const { id } = req.params;
        await pool.query(
            'DELETE FROM incidentes WHERE id = $1',
            [id]
        );
        res.json({
            success: true,
            message: 'Reporte eliminado',
        });
    } catch (error) {
        console.log(error);
        res.status(500).json({
            error: 'Error eliminando reporte',
        });
    }

});

app.put('/incidentes/:id', async (req, res) => {
    try {
        const { id } = req.params;
        const { estado } = req.body;
        const result = await pool.query(
            `
            UPDATE incidentes
            SET estado = $1
            WHERE id = $2
            RETURNING *
            `,
            [estado, id]
        );
        res.json(result.rows[0]);
    } catch (error) {
        console.log(error);
        res.status(500).json({
            error: 'Error actualizando estado',
        });
    }
});