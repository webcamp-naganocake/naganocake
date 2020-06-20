Rails.application.routes.draw do
  # customer側ルーティング
  devise_for :customers, controllers: {
   sessions:      'customers/sessions',
   passwords:     'customers/passwords',
   registrations: 'customers/registrations'
  }

  scope module: 'customers' do
    root 'items#top'
    resources :items, only: [:show, :index]
   end


  namespace :customers do
   patch 'customers/withdraw' => 'customers#withdraw', as: 'customers_withdraw'
   get 'show' => 'customers#show'
   get 'customers/edit' => 'customers#edit'
   patch 'update' => 'customers#update'
   get 'quit' => 'customers#quit'
   resources :orders, only: [:create, :index, :show]
   post 'orders' => 'orders#new'
   get 'orders' => 'orders#new'
   get 'orders/about' => 'orders#about'
   get 'orders/complete' => 'orders#complete'
   resources :cart_items, only: [:index, :create, :update, :destroy]
   delete 'cart_items' => 'cart_items#all_destroy'
   resources :shipping_addresses, only: [:index, :create, :destroy, :edit, :update]
  end

  # admin側ルーティング
  devise_for :admins, controllers: {
   sessions:      'admins/sessions',
   passwords:     'admins/passwords',
   registrations: 'admins/registrations'
  }

  namespace :admins do
   get 'top' => 'top#top'
   resources :customers, only: [:index, :edit, :update, :show]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :items, only: [:show, :index, :new, :create, :edit, :update]
   resources :orders, only: [:index, :show, :update]
   resources :orders_details, only: [:update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
