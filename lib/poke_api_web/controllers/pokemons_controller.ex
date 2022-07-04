defmodule PokeApiWeb.PokemonsController do
  use PokeApiWeb, :controller

  def create(conn, params) do
    params
    |> PokeApi.create_pokemon()
    |> handle_response(conn)
  end

  defp handle_response({:ok, pokemon}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", pokemon: pokemon)
  end

  defp handle_response({:error, error}, conn) do
    conn
    |> send_resp(401, error)
  end
end
