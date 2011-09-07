  class ShortUrl
    attr_reader :short_url
    attr_reader :url

    def initialize(url)
      http = Net::HTTP.new("www.googleapis.com", 443)
      http.use_ssl = true

      params = {'longUrl' => url}.to_json
      resp, body = http.post("/urlshortener/v1/url", params, {'Content-Type' => 'application/json'})
      body = JSON.parse(body)

      if resp.code.to_i == 200
        @short_url = body["id"]
        @url = body["longUrl"]
      else
        error = body["error"]
        raise "Shortening error: #{error["code"]} - #{error["message"]}"
      end
    end
  end
