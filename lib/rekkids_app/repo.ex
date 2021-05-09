defmodule RekkidsApp.Repo do
  use Ecto.Repo,
    otp_app: :rekkids_app,
    adapter: Ecto.Adapters.MyXQL
end
