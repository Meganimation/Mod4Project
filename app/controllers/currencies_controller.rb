class CurrenciesController < ApplicationController


  
    def index 
        @currencies = Currency.all
        # render json: currencies, except: [:created_at, :updated_at], include: :games, except: [:created_at, :updated_at]
    end
    
    
    
    
    def new 
      currency = Currency.new(currency_params)
      if Currency.save
          render json: currency, except: [:created_at, :updated_at]
      else 
          render json: { errors: currency.errors } 
      end
    end 
    
    
      def show
        render json: @currency = Currency.find(params[:id])
      end
    
    
    
      def create
        currency = Currency.new(currency_params)
    
        if currency.save
          render json: currency, status: :created
        else
          render json: currency.errors, status: :unprocessable_entity
        end
      end
    
      def edit
        @currency = Currency.find(params[:id])
      end
    
      def update
        currency = Currency.find(params[:id])
          if currency.update(currency_params)
            render json: currency
          else 
            render json: { errors: currency.errors } 
          end
      end
    
      def destroy
        @currency = Currency.find(params[:id])
        @currency.destroy
      end
    
    


    def search 
    @currencies = Currency.where('LOWER(name) LIKE ?', "%#{params[:search].downcase}%")
    render json: { currencies: @currencies }
    end
#takes in the currency id and the amount owend, returns finals caluclations


    def calculate
        amount = params[:amount]
        render json: {
            currency: currency,
            current_price: currency.current_price,
            amount: amount,
            value: currency.calculate_value(amount)
        }
    end


    private 

    def currency 
        @currency ||= Currency.find(params[:id])
    end 

    
    def set_currency
      @currency = Currency.find(params[:id])
    end
  
    def currency_params
      params.permit(:name, :imgurl, :currencytype)
    end

end
