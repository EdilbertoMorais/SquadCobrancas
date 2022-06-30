defmodule PokeApi.Repo.Migrations.AddPokemonTable do
  use Ecto.Migration

  def change do
    create table(:pokemon) do
      add :name, :string, null: false
      add :img_url, :string, null: false

      timestamps()
    end
  end
end
