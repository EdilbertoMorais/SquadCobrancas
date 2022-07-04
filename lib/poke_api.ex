defmodule PokeApi do
  alias PokeApi.Pokemons

  defdelegate create_pokemon(params), to: Pokemons.Create, as: :call
end
