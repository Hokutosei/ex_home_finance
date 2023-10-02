defmodule ExHomeFinance.Monthlies do
  import Ecto.Query, warn: false
  alias ExHomeFinance.Repo

  alias ExHomeFinance.Monthlies.Monthly

  def list_monthlies do
    result = Ecto.Adapters.SQL.query!(Repo, "SELECT * FROM monthlies ORDER BY inserted_at DESC")
    Enum.map(result.rows, fn [id, year, name, monthly_id, total_amount, inserted_at, updated_at] ->
      %ExHomeFinance.Monthlies.Monthly{
        id: Ecto.UUID.load!(id),
        year: year,
        name: name,
        monthly_id: Ecto.UUID.load!(monthly_id),
        total_amount: total_amount,
        inserted_at: inserted_at,
        updated_at: updated_at
      }
    end)
  end

  def get_monthly!(id), do: Repo.get!(Monthly, id)

  def create_monthly(attrs \\ %{}) do
    %Monthly{}
    |> Monthly.changeset(attrs)
    |> Repo.insert()
  end
end
