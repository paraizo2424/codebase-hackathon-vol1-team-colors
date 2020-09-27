require "rails_helper"

RSpec.describe StudiedRecordsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/studied_records").to route_to("studied_records#index")
    end

    it "routes to #show" do
      expect(get: "/studied_records/1").to route_to("studied_records#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/studied_records").to route_to("studied_records#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/studied_records/1").to route_to("studied_records#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/studied_records/1").to route_to("studied_records#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/studied_records/1").to route_to("studied_records#destroy", id: "1")
    end
  end
end
