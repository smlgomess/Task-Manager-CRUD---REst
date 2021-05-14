Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :tasks
    end
  end
  get '*other', to: 'home#index'
end
