Rails.application.routes.draw do

  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
  	get "search_users" => "users#search",as: 'search_users'
  	get "search_movies" => "items#search", as:'search_movies'

    resources :users,        only:[:index, :show, :edit, :update, :destroy]

    resources :movies,       only:[:new, :create, :edit, :update, :destroy, :show, :index] do
    resources :casts,        only:[:edit]
    resources :years,        only:[:edit]
    resources :genres,       only:[:edit]
    end
    resources :casts,        except:[:edit]
    resources :years,        except:[:edit]
    resources :genres,       except:[:edit]
    resources :movies,       only:[:new, :create, :edit, :update, :destroy]
    resources :reviews,      only:[:destroy]
  end

    get "search_users" => "movies#search",as: 'search_users'
    get "search_movies" => "movies#search", as:'search_movies'

    resources :users,        only:[:show, :edit, :update, :resign, :destroy]
    resources :movies,       only:[:index, :show] do
    resources :reviews,      only:[:new, :create, :edit, :update, :destroy]
    resource  :likes,        only:[:create, :destroy]
    end

  root "movies#index"
end