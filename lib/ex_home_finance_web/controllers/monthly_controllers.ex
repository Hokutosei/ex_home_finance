defmodule ExHomeFinanceWeb.MonthlyController do
  use ExHomeFinanceWeb, :controller

  alias ExHomeFinance.Monthlies

  def index(conn, _params) do
    monthlies = Monthlies.list_monthlies()
    json(conn, monthlies)
  end

  def create(conn, monthly_params) do
    case Monthlies.create_monthly(monthly_params) do
      {:ok, monthly} ->
        conn
        |> put_status(:created)
        |> json(monthly)

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
