Rails.application.routes.draw do
  get "/books/:id" => "books#show"
  delete "/books/:id" => "books#destroy"

  resources :tasks
  resources :publishers

  # resources :publishers do
  #   resources :books
  #
  #   # memberを利用すると、「/publishers/:id/detail」のように、個別のリソースに対してアクションを設定する
  #   member do
  #     get 'detail'
  #   end
  #
  #   # collectionを利用すると、「/publishers/search」のように、全体のリソースに対するアクションを設定する
  #   collection do
  #     get 'search'
  #   end
  # end
end
