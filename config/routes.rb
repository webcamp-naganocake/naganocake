Rails.application.routes.draw do

  devise_for :admins, controllers: {
   sessions:      'admins/sessions',
   passwords:     'admins/passwords',
   registrations: 'admins/registrations'
  }

  devise_for :customers, controllers: {
   sessions:      'customers/sessions',
   passwords:     'customers/passwords',
   registrations: 'customers/registrations'
  }

  namespace :customers do
   get 'show' => 'customers#show'
   get 'edit' => 'customers#edit'
   patch 'update' => 'customers#update'
   get 'quit' => 'customers#quit'
   patch '' => 'customers#withdraw'
   resources :orders, only: [:create, :index, :show]
   post 'orders' => 'orders#new'
   get 'orders/about' => 'orders#about'
   get 'orders/complete' => 'orders#complete'
   resources :cart_items, only: [:index, :create, :update, :destroy]
   delete 'cart_items' => 'cart_items#all_destroy'
   resources :shipping_addresses, only: [:index, :create, :destroy, :edit, :update]
  end

  scope module: 'customers' do
   root 'items#top'
   resources :items, only: [:show, :index]
  end

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
