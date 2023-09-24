defmodule ExHomeFinanceWeb.MonthlyController do
  use ExHomeFinanceWeb, :controller

  alias ExHomeFinance.Monthlies

  def index(conn, _params) do
    monthlies = Monthlies.list_monthlies()
    json(conn, monthlies)
  end

  def create(conn, %{"monthly" => monthly_params}) do
    case Monthlies.create_monthly(monthly_params) do
      {:ok, monthly} ->
        conn
        |> put_status(:created)
        |> json(monthly)
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> halt()
    end
  end
end
