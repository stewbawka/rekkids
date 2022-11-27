defmodule RekkidsApp.Auth do
  @moduledoc """
  The Auth context.
  """

  alias RekkidsApp.Repo
  alias RekkidsApp.Auth.User

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
