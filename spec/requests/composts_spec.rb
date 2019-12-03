require 'rails_helper'

RSpec.describe "Composts", type: :request do
  describe "GET /composts" do
    it "works! (now write some real specs)" do
      get composts_path
      expect(response).to have_http_status(200)
    end
  end
end
