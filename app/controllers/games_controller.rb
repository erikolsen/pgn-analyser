class GamesController < ApplicationController
  def index
  end

  def new
    @game = Game.new
  end

  def create
    parser = PgnParser.new(pgn_params)
    if parser.create_models!
      redirect_to players_path
    else
      render :new
    end
  end

  def show
  end

  private
  def pgn_params
    params[:file] ? File.read(params[:file].path) : params[:game][:pgn].gsub(/\r/, '')
  end
end
