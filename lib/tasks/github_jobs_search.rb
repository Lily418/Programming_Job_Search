require 'open-uri'
require 'json'

page = 1


loop do
  listings  = nil
  open("https://jobs.github.com/positions.json?page=#{page}") { |f|
    listings = JSON.parse(f.read)
    listings .each { |listing|
      Listing.create(text: listing['description'], id_source: "github" << listing['id'])
    }
  }
  break if listings == []
  page += 1
end