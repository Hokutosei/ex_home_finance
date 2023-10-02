defmodule ExHomeFinance.Expenses.Expense do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @derive {Jason.Encoder, only: [:id, :year, :name, :monthly_id, :total_amount, :inserted_at, :updated_at]}
#   CREATE TABLE IF NOT EXISTS ExpenseItem (
#     year VARCHAR(255),
#     month_name VARCHAR(255),
#     created_at TIMESTAMP NOT NULL,
#     amount FLOAT NOT NULL,
#     id CHAR(36) NOT NULL,
#     monthly_id CHAR(36) NOT NULL
# );
  schema "ExpenseItem" do
    field :year, :string
    field :month_name, :string
    field :created_at, :string
    field :amount, :float
    field :id, Ecto.UUID, autogenerate: true
    field :monthly_id, Ecto.UUID, autogenerate: true

  end

  def changeset(expense, attrs) do
    expense
    |> cast(attrs, [:year, :month_name, :created_at, :amount, :id, :monthly_id])
    |> validate_required([:year, :month_name, :created_at, :amount, :id, :monthly_id])
  end

end
