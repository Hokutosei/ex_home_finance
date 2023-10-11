defmodule ExHomeFinance.Monthlies.Monthly do
  use Ecto.Schema
  import Ecto.Changeset

# CREATE TABLE IF NOT EXISTS Monthlies (
#     id VARCHAR(36) NOT NULL PRIMARY KEY,
#     year VARCHAR(255),
#     name VARCHAR(255),
#     monthly_id VARCHAR(36),
#     total_amount DOUBLE,
#     inserted_at DATETIME NOT NULL,
#     updated_at DATETIME NOT NULL
# );



  @primary_key {:id, :string, autogenerate: false}
  @derive {Jason.Encoder, only: [:id, :year, :name, :monthly_id, :total_amount, :inserted_at, :updated_at]}
  schema "Monthlies" do
    field :year, :string
    field :name, :string
    field :monthly_id, :string
    field :total_amount, :float
    timestamps()
  end

  def changeset(monthly, attrs) do
    monthly
    |> cast(attrs, [:id, :year, :name, :monthly_id, :total_amount])
    |> validate_required([:id, :name, :monthly_id, :total_amount])
  end
end

defimpl Jason.Encoder, for: Ecto.UUID do
  def encode(uuid, opts) when is_binary(uuid) do
    IO.puts("encode uuid monthly ---------")
    uuid
    |> Ecto.UUID.cast!()
    |> Jason.Encode.string(opts)
  end
end
