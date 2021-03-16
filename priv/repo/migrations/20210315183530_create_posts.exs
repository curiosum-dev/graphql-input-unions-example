defmodule Liu.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :content, :string
      add :resource_url, :string
      add :length, :integer
      add :type, :string

      timestamps()
    end
  end
end
