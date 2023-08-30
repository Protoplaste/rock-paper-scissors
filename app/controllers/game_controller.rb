class GameController < ApplicationController
  def new
    @possible_bets = ["Rock", "Paper", "Scissors"]
  end

  def throw
    result = GameService.play(params[:player_bet])
    flash.notice = result
    redirect_to action: :new
  end
end
