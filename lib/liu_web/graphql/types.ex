defmodule LiuWeb.GraphQL.Types do
  use Absinthe.Schema.Notation
  alias Liu.Blog.Post

  object :post do
    field(:id, :id)
    field(:type, :string)
    field(:title, :string)
    field(:content, :string)
    field(:resource_url, :string)
    field(:length, :integer)
  end

  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  # ------------------------------------------------------
  # Union elements
  # ------------------------------------------------------
  #
  #   object :post_commons do
  #     field(:id, :id)
  #     field(:type, :string)
  #     field(:title, :string)
  #   end
  #
  #   # Post types
  #
  #   object :text_post do
  #     field(:content, :string)
  #
  #     import_fields(:post_commons)
  #   end
  #
  #   object :video_post do
  #     field(:resource_url, :string)
  #     field(:length, :integer)
  #
  #     import_fields(:post_commons)
  #   end
  #
  #   object :image_post do
  #     field(:resource_url, :string)
  #
  #     import_fields(:post_commons)
  #   end
  #
  #   # Union
  #
  #   union :post_union do
  #     types([
  #       :text_post,
  #       :image_post,
  #       :video_post
  #     ])
  #
  #     resolve_type(fn
  #       %Post{type: "text"}, _ -> :text_post
  #       %Post{type: "video"}, _ -> :video_post
  #       %Post{type: "image"}, _ -> :image_post
  #     end)
  #   end
end
