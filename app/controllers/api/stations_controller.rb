class API::StationsController < ApplicationController

  def index
    @stations = Station.all
    if @stations.length > 0
      respond_to do |format|
        format.json do
          render :json => @stations.to_json(:except => [ :id, :timestamp ])
        end
      end
    else
      render :json => {"error" => "No stations to populate"}.to_json
    end
  end

end
