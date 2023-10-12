defmodule ExHomeFinance.Expenses do
  import Ecto.Query, warn: false
  alias ExHomeFinance.Repo

  alias ExHomeFinance.Expenses.Expense

  def list_expenses do
    result = Ecto.Adapters.SQL.query!(Repo, "SELECT * FROM ExpenseItem ORDER BY created_at DESC")
    Enum.map(result.rows, fn [year, month_name, created_at, amount, id, monthly_id] ->
      %ExHomeFinance.Expenses.Expense{
        year: year,
        month_name: month_name,
        created_at: created_at,
        amount: amount,
        id: id,
        monthly_id: monthly_id
      }
    end)
  end

  def get_expense!(id), do: Repo.get!(Expense, id)

  def create_expense(attrs \\ %{}) do
    attrs = Map.put_new(attrs, "created_at", DateTime.truncate(DateTime.utc_now(), :second))
    |> Map.put_new("id", Ecto.UUID.generate())

    %Expense{}
    |> Expense.changeset(attrs)
    |> Repo.insert()
  end

  def list_expenses_by_month(year, month) do
    result = Ecto.Adapters.SQL.query!(Repo, "SELECT * FROM ExpenseItem WHERE year = ? and month_name = ? ORDER BY created_at DESC", [year, month])
    Enum.map(result.rows, fn [year, month_name, created_at, amount, id, monthly_id] ->
      %ExHomeFinance.Expenses.Expense{
        year: year,
        month_name: month_name,
        created_at: created_at,
        amount: amount,
        id: id,
        monthly_id: monthly_id
      }
    end)
  end

  def sum_expenses_by_month(year, month) do
    result = Ecto.Adapters.SQL.query!(Repo, "SELECT sum(amount) FROM ExpenseItem WHERE year = ? and month_name = ?", [year, month])
    Enum.map(result.rows, fn [sum] ->
      sum
    end)
    |> List.first()
  end

end
