class StoresController < ApplicationController


    def index 
        stores = Store.all
        render json: stores, except: [:created_at, :updated_at], include: :currency, except: [:created_at, :updated_at]
    end
    
    
    
    
    def new 
      store = Store.new(store_params)
      if Store.save
          render json: store, except: [:created_at, :updated_at]
      else 
          render json: { errors: store.errors } 
      end
    end 
    
    
      def show
        render json: @store = Store.find(params[:id])
      end
    
    
    
      def create
        store = Store.new(store_params)
    
        if store.save
          render json: store, status: :created
        else
          render json: store.errors, status: :unprocessable_entity
        end
      end
    
      def edit
        @store = Store.find(params[:id])
      end
    
      def update
        store = Store.find(params[:id])
          if store.update(store_params)
            render json: store
          else 
            render json: { errors: store.errors } 
          end
      end
    
      def destroy
        @store = Store.find(params[:id])
        @store.destroy
      end
    
      private
    
      def set_store
        @store = Store.find(params[:id])
      end
    
      def store_params
        params.permit(:name, :imgurl, :storetype)
      end

end
