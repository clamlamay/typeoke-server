class AccountsController < ApplicationController

	@username = ''

	get '/' do
		Account.all.to_json
	end

	get '/:id' do
		@id = params[:id]
		Account.find(@id).to_json
	end

	post '/register' do
		@username = params[:username]
		@password = params[:password]
		password_salt = BCrypt::Engine.generate_salt
		password_hash = BCrypt::Engine.hash_secret(@password, password_salt)
	
		@model = Account.new
		@model.username = @username
		@model.password = @password
		@model.api_key = 'kota'
		@model.password_hash = password_hash
		@model.password_salt = password_salt
		@model.save

		@account_message = "You have successfully registered and you are logged in :)"
		
		@model.to_json
	end

	post '/login' do
		@username = params[:username]
		@password = params[:password]
		@api_key = params[:api_key]
		if does_user_exist?(@username) == false
			{:status => 403}.to_json
		end

		@model = Account.where(:username => @username).to_json	
		# {:message => 'Welcome Back'}.to_json
		# @model.username = @username
		# @model.password = @password
		# @model.api_key = @api_key

		# @model = Account.where(:username => @username).first!
		# if @model.password_hash == BCrypt::Engine.hash_secret(@password, @model.password_salt)
		# 	@account_message = "Welcome back!"
		# 	session[:user] = @model

		# 	@username = session[:user][:username]

		# 	return erb :login_notice
		# else
		# 	@account_message = "Sorry, you password did not match. Try again?"
		# 	return erb :login_notice
		# end
	end

	get '/logout' do
		# session[:user] = nil
		redirect '/'
	end

	delete '/:id' do
		@id = params[:id]
		@model = Account.find(@id)
		@model.destroy

		{ :message => 'User has been deleted.'}.to_json
	end

end
