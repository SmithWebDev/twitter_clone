class Components::Post < Matestack::Ui::Component
  requires :post

  def response
    div class: 'mb-3 p-3 rounded shadow-sm', id: "post-#{context.post.id}" do
      heading size: 5 do
        plain context.post.username
        small text: context.post.created_at.strftime('%d.%m.%Y %H:%M')
      end
      toggle hide_on: "edit-post-#{context.post.id}", show_on: "updated", init_show: true do 
        show_partial
      end
      toggle show_on: "edit-post-#{context.post.id}", hide_on: "updated" do 
        edit_partial
      end
      #
    end
  end

  private 

  def show_partial
    paragraph text: context.post.body, class: 'mb-5'
    action path: like_post_path(context.post), method: :put do
      button class: 'btn btn-light' do
        plain "like (#{context.post.likes_count})"
      end
    end
    onclick emit: "edit-post-#{context.post.id}", class: 'd-inline' do
      button class: 'btn btn-link' do
        plain 'Edit'
      end
    end
  end

  def edit_partial
    matestack_form form_config_helper do
      div class: 'mb-3' do
        form_input key: :body, type: :text, placeholder: "What's up?", class: 'form-control'
      end
      div class: 'mb-3' do
        button 'submit', type: :submit, class: 'btn btn-primary', test: "Update!"
      end
    end
  end

  def form_config_helper 
    {
    for: context.post, path: post_path(id: context.post.id), method: :put,
    success: {emit: "updated"},
    failure: {emit: "form_failed"},
    errors: {wrapper: {tag: :div, class: 'invalid-feedback'}, input: {class: 'is-invalid'}}
    }
  end
end
