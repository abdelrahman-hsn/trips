Rails.application.routes.draw do
  scope 'api' do
    resources :trips do
      member do
        post :update_location
      end
    end
  end
end
