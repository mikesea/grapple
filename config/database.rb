DB_CONFIG = {

  development: {
    adapter: "sqlite",
    database: "db/development.sqlite3",
    pool: 5,
    timeout: 5000
  },

  test: {
    adapter: "sqlite",
    database: "db/test.sqlite3",
    pool: 5,
    timeout: 5000
  }

}
