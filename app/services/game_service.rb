class GameService
  WIN_MAP = {"Rock" => ["Scissors"], "Paper" => ["Rock"], "Scissors" => ["Paper"]}.freeze
  POSSIBLE_BETS = ["Rock", "Paper", "Scissors"]

  def self.play(player_throw)
    server_throw = CurbRockPaperScissorsClient.get_server_throw

    if player_throw == server_throw
      "Draw"
    elsif WIN_MAP[player_throw].include?(server_throw)
      "You win!"
    else
      "You loose"
    end
  end
end
