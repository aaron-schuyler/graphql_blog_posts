module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false

    field :posts, [Types::PostType], null: false do
      argument :user_id, ID, required: false
    end

    field :post, Types::PostType, null: false do
      argument :id, ID, required: true
    end

    def post(id:)
      Post.find(id)
    end

    def posts(args)
      if args
        Post.where(args)
      else
        Post.all
      end
    end

    def users
      User.all
    end
  end
end
