class PostsController < ApplicationController
  matestack_app TwitterClone::App

  def index
    render TwitterClone::Pages::Posts::Index
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: {
        message: 'Post was successfully created.'
      }, status: :created
    else
      render json: {
        errors: @post.errors,
        message: 'Post could not be created.'
      }, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:body, :username)
  end
end
