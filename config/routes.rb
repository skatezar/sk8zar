Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  get 'shoeswapone', to: 'pages#shoeswapone', as: :shoeswapone
  get 'about', to: 'pages#about', as: :about
  get 'ambassador', to: 'pages#ambassador', as: :ambassador
  get 'skatedice', to: 'pages#skatedice', as: :skatedice
  get 'skatedice/easy', to: 'pages#skatediceeasy', as: :skatediceeasy
  get 'skatedice/medium', to: 'pages#skatedicemedium', as: :skatedicemedium
  get 'skatedice/hard', to: 'pages#skatedicehard', as: :skatedicehard
  get 'ledgedice', to: 'pages#ledgedice', as: :ledgedice
  get 'ledgedice/easy', to: 'pages#ledgediceeasy', as: :ledgediceeasy
  get 'ledgedice/medium', to: 'pages#ledgedicemedium', as: :ledgedicemedium
  get 'ledgedice/hard', to: 'pages#ledgedicehard', as: :ledgedicehard

  get 'sendit', to: 'pages#sendit', as: :sendit

  get 'tricktips', to: 'pages#tricktips', as: :tricktips

  get 'tapes', to: 'pages#tapes', as: :tapes

  get 'ledgepasscode', to: 'pages#ledgepasscode', as: :ledgepasscode

  get 'community', to: 'pages#community', as: :community
  get 'contact', to: 'pages#contact', as: :contact
  get '/myprofile', to: 'users#show', as: :my_profile
  get '/myprofile/edit', to: 'users#edit', as: :edit_my_profile
  put '/myprofile', to: 'users#update', as: :update_my_profile
  get 'users/:id' => 'users#showSeller', as: :user
  patch "set_expo_token/:id", to: 'users#set_expo_token'

  get 'showuser/:id', to: 'users#showUser', as: :show_user

  resources :skatespots

  resources :contests

  get 'myitems/:id' => 'users#myItems', as: :user_my_items
  get '/404', to: "errors#not_found"
  get '/422', to: "errors#unacceptable"
  get '/500', to: "errors#internal_error"
  resources :chatrooms, only: [:index, :show, :destroy] do
    resources :messages, only: :create
  end


  resources :items do
    resources :chatrooms, only: :create
    resources :skatezarcoinorders, only: [ :new, :create, :destroy ]
  end

  #blogs
  get 'blog', to: 'pages#blog', as: :blogs

  get 'blog/do-you-need-skateboarding-shoes', to: 'pages#blog1', as: :blog1

  get 'blog/where-to-skate-in-vienna', to: 'pages#blog2', as: :blog2

  get 'itemsold', to: 'pages#itemsold', as: :itemsold

  get 'itemavailable', to: 'pages#itemavailable', as: :itemavailable

  #sidekiq
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  #donations
  resources :donations do
    resources :donationreg, only: [:new, :create]
  end

  #skatezar tasks and coins

  resources :communitytasks do
    resources :claims, only: [ :new, :create, :show, :index, :destroy ]
  end

  get 'thankyou-claim', to: 'pages#claimsubmitted', as: :claimsubmitted

  get 'thankyou-task', to: 'pages#tasksubmitted', as: :tasksubmitted

  get 'thankyou-order', to: 'pages#ordersubmitted', as: :ordersubmitted

  get 'promoteitem', to: 'pages#promoteitem', as: :promoteitem

  get 'itempromoted-successfully', to: 'pages#promoteitemsuccessfully', as: :promoteitemsuccessfully

  get 'skatezarteam', to: 'pages#skatezarteam', as: :skatezarteam

  get 'skatezarteam/:id' => 'pages#showTeam', as: :showteam

  get 'myorders' => 'users#myorders', as: :myorders

  get 'myclaims' => 'users#myclaims', as: :myclaims

  get 'allorders-pending' => 'pages#allorderspending', as: :allorderspending

  get 'allorders-completed' => 'pages#allorderscompleted', as: :allorderscompleted

  get 'allclaims-pending' => 'pages#allclaimspending', as: :allclaimspending

  get 'allclaims-completed' => 'pages#allclaimscompleted', as: :allclaimscompleted

  get 'coin-products' => 'pages#coinproducts', as: :coinproducts

  get 'coins-awarded' => 'pages#coinsawarded', as: :coinsawarded

  get 'order-completed' => 'pages#ordercompleted', as: :ordercompleted

  get 'websitepolicy', to: 'pages#websitepolicy', as: :websitepolicy

  get 'msg', to: 'pages#allmessages', as: :allmessages

  get 'sold-items', to: 'pages#solditems', as: :solditems

  #skate events
  resources :skateevents
end
