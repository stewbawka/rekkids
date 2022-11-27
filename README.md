# RekkidsApp

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Migrations

# General cheatsheet
https://devhints.io/phoenix-migrations

# Generate Migrations
Run this command locally (or shell into container and cp file to local):
`mix ecto.gen.migration <model name>`

# Run Migrations
Shell into workload and then run:
`mix ecto.migrate`

## Docker

Install deps after doing docker build and getting image:
`docker run -ti -v ${PWD}:/app <docker image> mix deps.get`

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
