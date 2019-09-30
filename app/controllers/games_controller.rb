class GamesController < ApplicationController

  def index 
    games = Game.all
    render json: games, except: [:created_at, :updated_at]
end




def new 
  game = Game.new(game_params)
  if Game.save
      render json: game, except: [:created_at, :updated_at]
  else 
      render json: { errors: game.errors } 
  end
end 


  def show
    render json: @game = Game.find(params[:id])
  end



  def create
    game = Game.new(game_params)

    if game.save
      render json: game, status: :created
    else
      render json: game.errors, status: :unprocessable_entity
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    game = Game.find(params[:id])
      if game.update(game_params)
        render json: game
      else 
        render json: { errors: game.errors } 
      end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.permit(:name, :imgurl, :gametype)
  end





end
