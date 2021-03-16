defmodule Liu.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :string
    field :length, :integer
    field :resource_url, :string
    field :title, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :content, :resource_url, :length, :type])
    |> validate_required([:title, :type])
    |> validate_inclusion(:type, ["text", "image", "video"])
    |> validate_by_type(attrs)
  end

  defp validate_by_type(changeset, %{type: "text"}) do
    changeset
    |> validate_required([:content])
  end

  defp validate_by_type(changeset, %{type: "image"}) do
    changeset
    |> validate_required([:resource_url])
  end

  defp validate_by_type(changeset, %{type: "video"}) do
    changeset
    |> validate_required([:resource_url, :length])
  end

  defp validate_by_type(changeset, _attrs), do: changeset
end
