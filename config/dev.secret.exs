# Configure your database
config :metex, Metex.Repo,
  username: "postgres",
  password: "postgres",
  database: "metex_dev",
  hostname: "localhost",
  pool_size: 10
