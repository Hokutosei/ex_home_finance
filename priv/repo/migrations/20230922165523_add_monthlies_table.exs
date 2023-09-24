# mix ecto.gen.migration add_monthlies_table
# mix ecto.migrate

defmodule ExHomeFinance.Repo.Migrations.AddMonthliesTable do
  use Ecto.Migration

  def change do
    create table(:monthlies, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :monthly_id, :uuid, autogenerate: true
      add :total_amount, :float

      timestamps()
    end
  end
end
