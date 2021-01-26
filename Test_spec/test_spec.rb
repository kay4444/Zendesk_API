require_relative '../rails_helper'
require 'faker'

describe 'API' do
  context "Tests." do
    it "Create a Lead.", :passed => true do
      id = create_lead(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)["data"]["id"]
      id2 = get_lead(id)["data"]["id"]
      expect(id).to eq(id2)
    end

    it "Add address to a Lead.", :passed => true do
      id = create_lead(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)["data"]["id"]
      update_lead(id: id, line1: "2726 Smith Street", city: "Hyannis", postal_code: "02601", state: "MA", country: "US")
      expect(get_lead(id).to_s.to_s).to include('"line1"=>"2726 Smith Street", "city"=>"Hyannis", "postal_code"=>"02601", "state"=>"MA", "country"=>"US"')
    end

  end
end

