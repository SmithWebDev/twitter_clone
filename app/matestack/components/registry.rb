module Components::Registry
  def post_component(post:)
    Components::Post.call(post: post)
  end
end
