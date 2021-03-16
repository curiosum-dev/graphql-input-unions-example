defmodule LiuWeb.GraphQL.Resolver do
  alias Liu.Blog

  def list_posts(_, _) do
    {:ok, Blog.list_posts()}
  end

  def post_by_id(%{id: id}, _) do
    {:ok, Blog.get_post!(id)}
  end

  def create_post(params, _) do
    for _ <- 1..10 do
      IO.puts("")
    end

    IO.puts("====================================")
    IO.inspect("New post params:")
    IO.puts("")

    params
    |> IO.inspect()

    IO.puts("")
    IO.puts("====================================")

    for _ <- 1..10 do
      IO.puts("")
    end

    {:ok, %{res: true}}
  end
end
