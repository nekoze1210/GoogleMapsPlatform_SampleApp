module Api
  class MapsController < ApplicationController

    # 逆ジオコーディングを行うAPI
    def reverse
      result = GoogleMapService.reverse_geocoding(params[:latlng])
      render json: { result: result }
    end

    # 住所・スポットのキーワードから住所情報の検索を行うAPI
    def autocomplete
      GoogleMapService.reverse_geocoding(params[:input], params[:location])
      render json: { result: results }
    end
  end
end
