require 'rails_helper'

RSpec.describe Station, :type => :model do

  describe "#get_stations_data" do
    xit "returns a hash of stations on success" do
      expect(Station.get_stations_data[:success]).to eq(true)
    end

    it 'just works' do
      Station.get_stations_data
    end

    it 'returns an error when the request fails' do
      expect(Station.get_stations_data('http://www.google.com/nope')[:error]).to eq(true)
    end

  end

end
