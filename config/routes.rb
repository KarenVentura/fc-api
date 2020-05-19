Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :v1, constraints: ApiConstraint.new(version: 1, provider: "application/vnd.fc") do
    get "jugadores/salarios", to: "salaries#index"
  end

  get "", :to => redirect('/documentation.html')
  match "*path", to: "route_errors#verify_error", via: :all
end
