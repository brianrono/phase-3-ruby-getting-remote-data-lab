# Write your code here
require 'net/http'
require 'json'

class GetRequester
    attr_reader :url

    def initialize(url)
        @url = url
    end

    def get_response_body
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parse_json
        response_body = get_response_body
        JSON.parse(response_body)
    end
end

url = "https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json"
requester = GetRequester.new(url)
data = requester.parse_json
puts data

