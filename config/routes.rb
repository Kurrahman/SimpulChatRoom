Rails.application.routes.draw do
    root controller: :rooms, action: :index

    resources :room_messages, controller: :room_messages
    resources :room_members
        post '/room_member',    to: 'room_members#create'
    resources :rooms, controller: :rooms
        post '/rooms',          to: 'rooms#create'
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"
end
