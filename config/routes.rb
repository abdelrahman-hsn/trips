Rails.application.routes.draw do
  scope 'api' do
    resources :trips
  end
end
