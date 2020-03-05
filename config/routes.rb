Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do
    get "/all_products" => "products#all_products"
    get "/first_product" => "products#first_product"
    get "/second_product" => "products#second_product"
    get "/third_product" => "products#third_product"

    get "/any_product" => "products#query"

    get "/choose_product/:product_num" => "products#query"
  end
end
