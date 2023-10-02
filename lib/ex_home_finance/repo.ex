defmodule ExHomeFinance.Repo do
  use Ecto.Repo,
    otp_app: :ex_home_finance,
    adapter: Ecto.Adapters.MyXQL
end
