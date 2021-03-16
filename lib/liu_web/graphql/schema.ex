defmodule LiuWeb.GraphQL.Schema do
  use Absinthe.Schema
  import_types(LiuWeb.GraphQL.Types)
  import_types(LiuWeb.GraphQL.InputTypes)

  alias LiuWeb.GraphQL.Resolver

  # Queries
  # - - - -
  query do
    field :all_posts, list_of(:post_union) do
      resolve(&Resolver.list_posts/2)
    end

    field :get_post, :post_union do
      arg(:id, :id)

      resolve(&Resolver.post_by_id/2)
    end
  end

  # Mutations
  # - - - -
  mutation do
    # ------------------------------------------------------
    # All in one
    # ------------------------------------------------------
    field :create_post_all_in_one, :result do
      arg(:title, non_null(:string))
      arg(:type, non_null(:string))
      arg(:content, :string)
      arg(:resource_url, :string)
      arg(:length, :integer)

      resolve(&Resolver.create_post/2)
    end

    #
    #
    #
    #
    #
    # ------------------------------------------------------
    # Tagged
    # ------------------------------------------------------
    field :create_post_tagged, :result do
      arg(:text_post, :tagged_text_post)
      arg(:image_post, :tagged_image_post)
      arg(:video_post, :tagged_video_post)

      resolve(&Resolver.create_post/2)
    end

    #
    #
    #
    #
    #
    # ------------------------------------------------------
    # Separate mutations
    # ------------------------------------------------------
    field :create_text_post, :result do
      arg(:title, :string)
      arg(:content, :string)

      resolve(fn params, _ ->
        params
        |> Map.put(:type, "text")
        |> Resolver.create_post(nil)
      end)
    end

    field :create_video_post, :result do
      arg(:title, :string)
      arg(:resource_url, :string)
      arg(:length, :integer)

      resolve(fn params, _ ->
        params
        |> Map.put(:type, "video")
        |> Resolver.create_post(nil)
      end)
    end

    field :create_image_post, :result do
      arg(:title, :string)
      arg(:resource_url, :string)

      resolve(fn params, _ ->
        params
        |> Map.put(:type, "image")
        |> Resolver.create_post(nil)
      end)
    end
  end
end
