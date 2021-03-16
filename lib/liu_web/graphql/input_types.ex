defmodule LiuWeb.GraphQL.InputTypes do
  use Absinthe.Schema.Notation
  alias Liu.Blog.Post

  input_object :post_input_commons do
    field(:type, :string)
    field(:title, :string)
  end

  # Post input types

  input_object :tagged_text_post do
    field(:content, :string)

    import_fields(:post_input_commons)
  end

  input_object :tagged_video_post do
    field(:resource_url, :string)
    field(:length, :integer)

    import_fields(:post_input_commons)
  end

  input_object :tagged_image_post do
    field(:resource_url, :string)

    import_fields(:post_input_commons)
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
  # Nothing important

  object :result do
    field(:res, :boolean)
  end
end
