defmodule Auth.User do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :id, 1, type: :string
  field :email, 2, type: :string
  field :first_name, 3, type: :string, json_name: "firstName"
  field :last_name, 4, type: :string, json_name: "lastName"
  field :created_at, 5, type: Google.Protobuf.Timestamp, json_name: "createdAt"
  field :updated_at, 6, type: Google.Protobuf.Timestamp, json_name: "updatedAt"
end