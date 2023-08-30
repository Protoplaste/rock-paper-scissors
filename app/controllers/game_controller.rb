class GameController < ApplicationController
  def new
    @possible_bets = ["Rock", "Paper", "Scissors"]
  end

  def throw
  end
end
