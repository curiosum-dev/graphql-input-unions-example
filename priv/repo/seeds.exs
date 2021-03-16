# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Liu.Repo.insert!(%Liu.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Liu.Repo
alias Liu.Blog
import Ecto.Query

posts_params = [
  %{
    type: "text",
    title: "Some text post",
    content: "Lorem ipsum dolor sit amend"
  },
  %{
    type: "image",
    title: "Some image post",
    resource_url:
      "https://images.pexels.com/photos/5502463/pexels-photo-5502463.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
  },
  %{
    type: "video",
    title: "Some video post",
    length: 666,
    resource_url: "https://www.youtube.com/watch?v=nIU4GnEdNH4"
  }
]

for params <- posts_params do
  Blog.create_post(params)
end
