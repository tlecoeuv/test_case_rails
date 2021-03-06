class UsersController < ApplicationController

	# GET /users
	def index
		users = User.all

		render json: users
	end

	# GET /users/:user_id
	def show
		user = User.find(params[:id])

		render json: user
	end

	# POST /users
	def create
		user = User.new(user_params)

		if user.save
			render json: user, status: :created
		else
			render json: user.errors, status: :unprocessable_entity
		end
	end

	# PATCH/PUT /users/:user_id
	def update
		user = User.find(params[:id])

		if user.update(user_params)
			render json: user, status: :ok
		else
			render json: user.errors, status: :unprocessable_entity
		end
	end

	# DELETE /users/:user_id
	def destroy
		user = User.find(params[:id])
		user.destroy!

		head :no_content
	end

	def user_params
		params.require(:user).permit(:email, :first_name, :last_name, :phone)
	end

end
