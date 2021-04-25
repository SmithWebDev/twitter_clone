Rails.application.routes.draw do
  resources :posts do
    member do
      put 'like', to: 'posts#like'
    end
  end
  scope :profile, as: :profile do
    get 'edit', to: 'profile#edit'
    put 'update', to: 'profile#update'
  end
end
