defmodule PokeApi.Pokemons.Models.Pokemon do
  use Ecto.Schema

  import Ecto.Changeset

  @required_params [:name, :img_url]

  schema "pokemons" do
    field :name, :string
    field :img_url, :string

    timestamps()
  end

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:name])
  end
end
