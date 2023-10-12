defmodule ExHomeFinanceWeb.Router do
  use ExHomeFinanceWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ExHomeFinanceWeb do
    pipe_through :api

    resources "/monthlies", MonthlyController, only: [:index, :create]
    resources "/expenses", ExpenseController, only: [:index, :create]

    get "/get_expenses/:year/:month", ExpenseController, :get_expense_by_month
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:ex_home_finance, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: ExHomeFinanceWeb.Telemetry
    end
  end
end
