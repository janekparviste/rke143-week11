const { Pool } = require('pg');
const itemsPool = new Pool({
    user: 'postgres',
    password: 'Koppen1111_',
    host: 'localhost',
    port: 5432,
    database: 'myrecipes',
});

module.exports = itemsPool;
