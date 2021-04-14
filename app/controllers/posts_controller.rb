class PostsController < ApplicationController
  matestack_app TwitterClone::App
  # GET /posts or /posts.json
  def index
    # Remove instance variable, opting to call the actual index.rb file directly
    # @posts = Post.all
    render TwitterClone::Pages::Posts::Index
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

#    respond_to do |format|
#      if @post.save
#        format.html { redirect_to @post, notice: "Post was successfully created." }
#        format.json { render :show, status: :created, location: @post }
#      else
#        format.html { render :new }
#        format.json { render json: @post.errors, status: :unprocessable_entity }
#      end
#    end
#  end

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
