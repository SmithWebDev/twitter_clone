class Components::Post < Matestack::Ui::Component
  requires :post

  def response
    # async rerender_on: "cable__liked_post_#{context.post.id}", id: "post-#{context.post.id}" do
    div class: 'mb-3 p-3 rounded shadow-sm', id: "post-#{context.post.id}" do
      heading size: 5 do
        plain context.post.username
        small text: context.post.created_at.strftime('%d.%m.%Y %H:%M')
      end
      paragraph text: context.post.body, class: 'mb-5'
      action path: like_post_path(context.post), method: :put do
        button class: 'btn btn-light' do
          plain "like (#{context.post.likes_count})"
        end
      end
    end
  end
  # end
end
