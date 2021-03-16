defmodule Liu.Repo do
  use Ecto.Repo,
    otp_app: :liu,
    adapter: Ecto.Adapters.Postgres
end
