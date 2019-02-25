Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    resources :maps, only: :index
    
    namespace 'maps' do
      get :reverse
      get :autocomplete
      get :direction
    end
  end
end
