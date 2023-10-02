defmodule ExHomeFinance.Monthlies.Monthly do
  use Ecto.Schema
  import Ecto.Changeset

# mysql
#   CREATE TABLE IF NOT EXISTS your_table_name (
#     total_amount DOUBLE PRECISION,
#     inserted_at TIMESTAMP,
#     updated_at TIMESTAMP,
#     monthly_id CHAR(36),
#     id CHAR(36),
#     name VARCHAR(255),
#     year VARCHAR(255)
# );


  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @derive {Jason.Encoder, only: [:id, :year, :name, :monthly_id, :total_amount, :inserted_at, :updated_at]}
  schema "monthlies" do
    field :year, :string
    field :name, :string
    field :monthly_id, Ecto.UUID, autogenerate: true
    field :total_amount, :float
    timestamps()
  end

  def changeset(monthly, attrs) do
    monthly
    |> cast(attrs, [:year, :name, :monthly_id, :total_amount])
    |> validate_required([:name, :monthly_id, :total_amount])
  end
end

defimpl Jason.Encoder, for: Ecto.UUID do
  def encode(uuid, _opts) when is_binary(uuid) do
    uuid
    |> Ecto.UUID.cast!()
    |> Jason.Encode.string(_opts)
  end
end
