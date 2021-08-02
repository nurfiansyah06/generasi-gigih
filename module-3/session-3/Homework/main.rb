require 'sinatra'
require_relative 'Models/item'
require_relative 'Models/category'

get '/' do
    items = Item.get_all_item_categories
    erb :index, locals:{
        items: items,
    }
end

get '/items/new' do
    categories = Category.get_all_categories
    erb :create, locals: {
        categories: categories
    }
end

post '/items/create' do
    name = params['name']
    price = params['price']
    category_id = params['category']
    insert_item_categories(name,price,category_id)
    redirect '/'
end

get '/items/:id' do
    detail_item = detail_item(params['id'])
    erb :detail, locals: {
        detail_item: detail_item
    }
end

get '/items/:id/edit' do
    detail_item = detail_item(params['id'])
    erb :edit, locals: {
        detail_item: detail_item
    }
end

delete '/items/:id' do 
    id = params['id']
    Item.delete_item(id)
    redirect '/'
end

put '/items/update' do 
    name = params['name']
    price = params['price']
    category_id = params['category']
    item_id = params['item_id']
    update_item_categories(name, price, item_id, category_id)
    redirect '/'
end