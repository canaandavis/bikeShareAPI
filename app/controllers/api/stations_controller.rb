class API::StationsController < ApplicationController

  def index
    @stations = Station.all
    if @stations
      respond_to do |format|
        format.json do
          render :json => @stations.to_json
        end
      end
    else
      render :json => {"error" => "No stations to populate"}.to_json
  end

end
