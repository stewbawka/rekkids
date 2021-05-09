FROM elixir:latest

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mix local.hex --force

RUN mix do compile

RUN mix local.rebar --force

CMD ["mix", "phx.server"]
