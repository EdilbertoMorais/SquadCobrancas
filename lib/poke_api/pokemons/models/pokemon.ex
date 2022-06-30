defmodule PokeApi.Pokemons.Models.Pokemon do
  use Ecto.Schema

  import Ecto.Changeset

  schema "pokemon" do
    field :name, :string
    field :img_url, :string

    timestamps()
  end

  @required_params [:name, :img_url]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end

  # exemplo do André (entender)
  # def changeset(%__MODULE__{} = model, params) do
  #   model
  #   |> cast(params, @required_params)
  #   |> validate_required(@required_params)
  # end
end
