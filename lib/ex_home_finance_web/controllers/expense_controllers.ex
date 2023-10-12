defmodule ExHomeFinanceWeb.ExpenseController do
  use ExHomeFinanceWeb, :controller

  alias ExHomeFinance.Expenses

  def index(conn, _params) do
    expenses = Expenses.list_expenses()
    json(conn, expenses)
  end

  def create(conn, expense_params) do
    IO.puts("create expense")
    case Expenses.create_expense(expense_params) do
      {:ok, expense} ->
        conn
        |> put_status(:created)
        |> json(expense)

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> halt()

      _ ->
        conn
        |> put_status(:internal_server_error)
        |> json(%{error: "Unexpected error"})
    end
  end

  def get_expense_by_month(conn, %{"year" => year, "month" => month}) do
    IO.puts("get_expense_by_month")
    IO.inspect(year)
    IO.inspect(month)

    expenses = Expenses.list_expenses_by_month(year, month)
    sum = Expenses.sum_expenses_by_month(year, month)
    json(conn, %{expenses: expenses, month_total: sum})
  end


end
