class CurbRockPaperScissorsClient
  require 'net/http'

  def self.get_server_throw
    uri = URI("https://private-anon-1fcb87526c-curbrockpaperscissors.apiary-mock.com/rps-stage/throw")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
    response = http.request(request)
    return local_throw unless response.kind_of? Net::HTTPSuccess


  private

  def self.local_throw
    GameService::POSSIBLE_BETS.sample
  end
end
