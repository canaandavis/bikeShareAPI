class API::StationsController < ApplicationController

  def index
    @stations = Station.all
    respond_to do |format|
      format.json do
        render :json => @stations.to_json
      end
    end
  end

end
