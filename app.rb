# https://github.com/lewagon/sinatra-101

require "pry-byebug"

require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

require_relative "cookbook"

# set :bind, '0.0.0.0'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  @cookbook = Cookbook.new(File.join(__dir__, 'recipes.csv'))
  @recipes = @cookbook.all
  erb :index
end

get '/new' do
  erb :new
end

get '/team/:username' do
  binding.pry
  puts params[:username]
  "The username is #{params[:username]}"
end
