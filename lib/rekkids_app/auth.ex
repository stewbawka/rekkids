defmodule RekkidsApp.Auth do
  @moduledoc """
  The Auth context.
  """

  alias RekkidsApp.Repo
  alias RekkidsApp.Auth.User

  @doc """
  Gets a single user by field.

  Returns nil if the User does not exist.

  ## Examples

      iex> get_user_by(source_id: 123)
      %User{}

      iex> get_user_by(source_id: 456)
      nil

  """
  def get_user_by(by) do
    Repo.get_by(User, by)
  end

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

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

end
