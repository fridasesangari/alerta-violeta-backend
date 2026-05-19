const { Pool } = require("pg");

const pool = new Pool({
    host: "aws-1-us-west-1.pooler.supabase.com",
    user: "postgres.txrwtweduzcakwwklbgd",
    password: "alertavioleta.",
    database: "postgres",
    port: 6543,
    ssl: {
        rejectUnauthorized: false
    }
});

pool.connect((err) => {
    if (err) {
        console.log("Error de conexión:", err);
    } else {
        console.log("PostgreSQL conectado");
    }
});

module.exports = pool;