require "rails_helper"

RSpec.describe CompostsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/composts").to route_to("composts#index")
    end

    it "routes to #new" do
      expect(:get => "/composts/new").to route_to("composts#new")
    end

    it "routes to #show" do
      expect(:get => "/composts/1").to route_to("composts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/composts/1/edit").to route_to("composts#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/composts").to route_to("composts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/composts/1").to route_to("composts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/composts/1").to route_to("composts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/composts/1").to route_to("composts#destroy", :id => "1")
    end
  end
end
