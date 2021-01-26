require 'rest-client'
require 'json'
ACCESS_TOKEN = '0a3ba603a106cc51a5d6e4cc05f7afbe4bd91c8e21a4635581159cf8b28ec693'

module ApiHelper

  def create_lead(first_name: "Mark3",
                  last_name: "Johnson3",
                  organization_name: "Design Services Company",
                  source_id: 10,
                  title: "CEO",
                  description: "I know him via Tom",
                  industry: "Design Services",
                  website: "http://www.designservice.com",
                  email: "mark1@designservices.com",
                  phone: "508-778-6516",
                  mobile: "508-778-6516",
                  fax: "+44-208-1234567",
                  twitter: "mjohnson",
                  facebook: "mjohnson",
                  linkedin: "mjohnson",
                  skype: "mjohnson",
                  line1: "2726 Smith Street",
                  city: "Hyannis",
                  postal_code: "02601",
                  state: "MA",
                  country: "US",
                  tags: "important",
                  known_via: "tom")
    headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{ACCESS_TOKEN}"
    }
    body = "{
        \"data\": {
            \"first_name\": \"#{first_name}\",
            \"last_name\": \"#{last_name}\",
            \"organization_name\": \"#{organization_name}\",
            \"source_id\": #{source_id},
            \"title\": \"#{title}\",
            \"description\": \"#{description}\",
            \"industry\": \"#{industry}\",
            \"website\": \"#{website}\",
            \"email\": \"#{email}\",
            \"phone\": \"#{phone}\",
            \"mobile\": \"#{mobile}\",
            \"fax\": \"#{fax}\",
            \"twitter\": \"#{twitter}\",
            \"facebook\": \"#{facebook}\",
            \"linkedin\": \"#{linkedin}\",
            \"skype\": \"#{skype}\",
            \"tags\": [\"#{tags}\"],
            \"custom_fields\": {
                \"known_via\": \"#{known_via}\"
            }
        }
    }"
    response = RestClient::Request.execute method: :post, url: "https://api.getbase.com/v2/leads", payload: body, headers: headers
    puts response
    JSON.parse(response)
  end

  def get_lead(id)
    headers = {
        "Accept" => "application/json",
        "Authorization" => "Bearer #{ACCESS_TOKEN}"
    }
    response = RestClient::Request.execute method: :get, url: "https://api.getbase.com/v2/leads/#{id}", headers: headers
    puts response
    JSON.parse(response)
  end

  def update_lead(id: "2048058850", line1: "2726 Smith Street", city: "Hyannis", postal_code: "02601", state: "MA", country: "US")
    headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{ACCESS_TOKEN}"
    }
    body = "{
        \"data\": {
            \"address\": {
                \"line1\": \"#{line1}\",
                \"city\": \"#{city}\",
                \"postal_code\": \"#{postal_code}\",
                \"state\": \"#{state}\",
                \"country\": \"#{country}\"
            }
        }
    }"
    response = RestClient::Request.execute method: :put, url: "https://api.getbase.com/v2/leads/#{id}", payload: body, headers: headers
    puts response
    JSON.parse(response)
  end

end