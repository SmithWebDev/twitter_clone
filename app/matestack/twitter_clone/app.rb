class TwitterClone::App < Matestack::Ui::App
  def response
    div class: 'container' do
      heading size: 1, text: 'Twitter Clone'
      transition path: posts_path, delay: 6000 do
        button class: 'btn btn-light', text: 'Timeline'
      end
      transition path: profile_edit_path, delay: 6000 do
        button class: 'btn btn-light', text: 'Your Profile'
      end
      div class: 'mt-5' do
        yield if block_given?
      end

      toggle show_on: 'submitted', hide_after: 5000 do
        div class: 'container fixed-bottom w-100 bg-success text-white p3 rounded-top' do
          heading size: 4, text: 'Success: {{ event.data.message }}'
        end
      end
      toggle show_on: 'form-failed', hide_after: 5000 do
        div class: 'container fixed-bottom w-100 bg-danger text-white p3 rounded-top' do
          heading size: 4, text: 'Error: {{ event.data.message }}'
        end
      end
    end
  end
end
