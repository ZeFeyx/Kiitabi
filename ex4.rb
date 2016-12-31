require 'sinatra'
require 'sequel'

DB = Sequel.connect('sqlite://./my_lib.db')

get '/' do
	@books = DB[:books].all
	erb :index
end

get '/new' do
	erb :new
end

post '/create' do
	title = params[:title]
	author = params[:author]
	description = params[:description]
	notes = params[:notes]
	
	DB[:books].insert(:title => title, 
					  :author => author,
					  :description => description,
					  :notes => notes)
	
	redirect '/'
end

get '/delete/:id' do
	DB[:books].where(:id => params[:id]).delete
	redirect '/'
end