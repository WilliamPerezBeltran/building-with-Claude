defmodule App1.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App1.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name"
      })
      |> App1.Accounts.create_user()

    user
  end
end
