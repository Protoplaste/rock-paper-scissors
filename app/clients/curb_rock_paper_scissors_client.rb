class CurbRockPaperScissorsClient
  require 'net/http'

  CURB_URL = "https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw".freeze

  def self.get_server_throw
    uri = URI(CURB_URL)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
    response = http.request(request)
    return local_throw unless response.kind_of? Net::HTTPSuccess

    JSON.parse(response.body)["body"].capitalize
  end

  private

  def self.local_throw
    GameService::POSSIBLE_BETS.sample
  end
end
