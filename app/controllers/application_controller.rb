class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  post '/recipes/new' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe.save
    redirect '/recipes/#{@recipe.id}'
  end

  # get '/recipes/:id' do
  #   @recipe = Recipe.find_by_id(params[:id])
  #   erb :
  # end


end
