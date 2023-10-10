defmodule ExHomeFinanceWeb.ExpenseController do
  use ExHomeFinanceWeb, :controller

  alias ExHomeFinance.Expenses

  def index(conn, _params) do
    expenses = Expenses.list_expenses()
    json(conn, expenses)
  end

  def create(conn, %{"expense" => expense_params}) do
    IO.puts("create expense")
    case Expenses.create_expense(expense_params) do
      {:ok, expense} ->
        conn
        |> put_status(:created)
        |> json(expense)

      {:error, %Ecto.Changeset{} = _changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> halt()

      _ ->
        conn
        |> put_status(:internal_server_error)
        |> json(%{error: "Unexpected error"})
    end
  end
end
