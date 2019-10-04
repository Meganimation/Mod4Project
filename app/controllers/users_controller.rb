class UsersController < ApplicationController

    
    def index 
        users = User.all
        render json: users, except: [:created_at, :updated_at], include: :currencies, except: [:created_at, :updated_at]
    end
    
    
    
    
    def new 
      user = User.new(user_params)
      if User.save
          render json: user, except: [:created_at, :updated_at]
      else 
          render json: { errors: user.errors } 
      end
    end 
    
    
      def show
        render json: @user = User.find(params[:id])
      end
    
    
    
      def create
        user = User.new(user_params)
    
        if user.save
          render json: user, status: :created
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end
    
      def edit
        @user = User.find(params[:id])
      end
    
      def update
        user = User.find(params[:id])
          if user.update(user_params)
            render json: user
          else 
            render json: { errors: user.errors } 
          end
      end
    
      def destroy
        @user = User.find(params[:id])
        @user.destroy
      end
    
      private
    
      def set_user
        @user = User.find(params[:id])
      end
    
      def user_params
        params.permit(:name, :imgurl, :usertype)
      end

end
