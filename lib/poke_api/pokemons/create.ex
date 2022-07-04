defmodule PokeApi.Pokemons.Create do
  alias PokeApi.Pokemons.Models.Pokemon
  alias PokeApi.Repo
  import Ecto.Changeset, only: [traverse_errors: 2]

  def call(params) do
    params
    |> Pokemon.build()
    |> Repo.insert()
    |> create_pokemon()
  end

  defp create_pokemon({:ok, struct}), do: {:ok, struct}
  defp create_pokemon({:error, changeset}), do: {:error, inspect(translate_errors(changeset))}

  defp translate_errors(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
