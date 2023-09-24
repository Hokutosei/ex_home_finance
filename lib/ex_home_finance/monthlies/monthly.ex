# defmodule ExHomeFinance.Monthlies.Monthly do
#   use Ecto.Schema
#   import Ecto.Changeset

#   @derive {Jason.Encoder, only: [:name, :monthly_id, :total_amount, :inserted_at, :updated_at, :year]}
#   schema "monthlies" do
#     field :name, :string
#     field :monthly_id, Ecto.UUID, autogenerate: true
#     field :total_amount, :float
#     timestamps()
#     field :year, :string
#   end

#   def changeset(monthly, attrs) do
#     monthly
#     |> cast(attrs, [:name, :year, :monthly_id, :total_amount])
#     |> validate_required([:name, :monthly_id, :total_amount])
#   end
# end
defmodule ExHomeFinance.Monthlies.Monthly do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @derive {Jason.Encoder, only: [:id, :name, :monthly_id, :total_amount, :inserted_at, :updated_at, :year]}
  schema "monthlies" do
    field :id, Ecto.UUID, primary_key: true
    field :name, :string
    field :monthly_id, Ecto.UUID, autogenerate: true
    field :total_amount, :float
    timestamps()
    field :year, :string
  end

  def changeset(monthly, attrs) do
    monthly
    |> cast(attrs, [:id, :name, :year, :monthly_id, :total_amount])
    |> validate_required([:id, :name, :monthly_id, :total_amount])
  end
end
