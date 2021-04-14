Rails.application.routes.draw do
  resources :posts do
    member do
      put 'like', to: 'posts#like'
    end
  end
end
