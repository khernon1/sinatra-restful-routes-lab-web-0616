require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #new
  get '/recipes/new' do
   erb :'new.html' 
  end

  #index
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #show
  get '/recipes/:id' do
   @recipe = Recipe.find(params[:id])
   erb :'show.html' 
  end

  #create
  post '/recipes' do
    recipe = Recipe.create(params)
    redirect "/recipes/#{recipe.id}"
  end

  #edit form
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])    
    erb :'edit.html'
  end


   post '/recipes/:id/edit' do
    recipe = Recipe.find(params[:id])
    recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    recipe.save
    redirect "/recipes/#{recipe.id}"
   end


  #delete
  post '/recipes/:id/delete' do
    recipe = Recipe.find(params[:id])
    recipe.destroy
  end

end