module Api
  class MapsController < ApplicationController

    # 逆ジオコーディングを行うAPI
    def reverse
      result = GoogleMapService.reverse_geocoding(params[:latlng])
      render json: result
    end

    # 住所・スポットのキーワードから住所情報の検索を行うAPI
    def autocomplete
      results = GoogleMapService.autocomplete(params[:input], params[:location])
      render json: results
    end
  end
end
