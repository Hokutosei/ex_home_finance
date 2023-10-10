defmodule ExHomeFinance.Expenses.Expense do
  use Ecto.Schema
  import Ecto.Changeset

#   CREATE TABLE IF NOT EXISTS ExpenseItem (
#     year VARCHAR(255),
#     month_name VARCHAR(255),
#     created_at TIMESTAMP NOT NULL,
#     amount FLOAT NOT NULL,
#     id CHAR(36) NOT NULL,
#     monthly_id CHAR(36) NOT NULL
# );
  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @derive {Jason.Encoder, only: [:id, :year, :month_name, :monthly_id, :amount, :created_at]}
  schema "ExpenseItem" do
    field :year, :string
    field :month_name, :string
    field :monthly_id, Ecto.UUID, autogenerate: true
    field :created_at, :naive_datetime
    field :amount, :float
  end

  def changeset(expense, attrs) do
    expense
    |> cast(attrs, [:year, :month_name, :created_at, :amount, :monthly_id])
    |> validate_required([:year, :month_name, :amount, :monthly_id])
  end

end

defimpl Jason.Encoder, for: Ecto.UUID do
  def encode(uuid, _opts) when is_binary(uuid) do
    IO.puts("encode uuid ---------")
    uuid
    |> Ecto.UUID.cast!()
    |> Jason.Encode.string(_opts)
  end
end
