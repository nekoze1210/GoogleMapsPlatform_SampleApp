class GoogleMapService
  class << self
    API_URI = 'https://maps.googleapis.com/'
    API_KEY = ENV['GOOGLE_MAPS_KEY']

    # latlng  緯度,経度
    # language  表示言語
    def reverse_geocoding(latlng, language = 'ja')
      response = connection.get('/maps/api/geocode/json', latlng: latlng, language: language, key: API_KEY)

      response.body['results'][0]
    end

    # input  検索ワード
    # location  検索の起点となる緯度,経度
    # radius  検索結果のlocationからの距離(メートル)
    # language  表示言語
    def autocomplete(input, location, radius = 5000, language = 'ja')
      response = connection.get(
        '/maps/api/place/autocomplete/json',
        input: input,
        location: location,
        radius: radius,
        language: language,
        key: API_KEY)
      results = []
      response.body['predictions'].map{ |prediction| results << result(prediction) }

      results
    end

    private

    def connection
      Faraday.new(API_URI) do |faraday|
        faraday.response :json
        faraday.adapter  Faraday.default_adapter
      end
    end

    def result(prediction)
      { place_id: prediction['place_id'], description: prediction['description'] } 
    end
  end
end
