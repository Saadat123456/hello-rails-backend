Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :v1, defaults: { format: 'json' } do
    get 'greeting', to: 'greetings#index'
    get '*page', to: 'greetings#default_route', constraint: -> (req) do
      !req.xhr? && req.format.html
    end
  end

  get '*path' => redirect('/')

  # Defines the root path route ("/")
  root "v1/greetings#default_route"
end
