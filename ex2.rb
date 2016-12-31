require 'sinatra'
require 'sequel'

DB = Sequel.connect('sqlite://./my_lib.db')

get '/' do
	@books = DB[:books].all
	erb :ex2
end