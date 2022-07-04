defmodule PokeApiWeb.PokemonsView do
  use PokeApiWeb, :view

  def render("create.json", %{pokemon: pokemon}) do
    %{
      message: "Pokemon created!"
    }
  end
end
