require "rails_helper"

RSpec.describe SquareRecordSubjectsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/square_record_subjects").to route_to("square_record_subjects#index")
    end

    it "routes to #show" do
      expect(get: "/square_record_subjects/1").to route_to("square_record_subjects#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/square_record_subjects").to route_to("square_record_subjects#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/square_record_subjects/1").to route_to("square_record_subjects#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/square_record_subjects/1").to route_to("square_record_subjects#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/square_record_subjects/1").to route_to("square_record_subjects#destroy", id: "1")
    end
  end
end
