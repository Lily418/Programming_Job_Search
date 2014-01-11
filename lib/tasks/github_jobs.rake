require 'open-uri'
require 'json'

def parse_listing(listing_id)
  Listing.find_by(id: listing_id)
end


namespace :github_jobs do
  desc 'Collect jobs from Github Jobs'
  task :github_collect => :environment do
    page = 1
	loop do
  	  listings  = nil
      open("https://jobs.github.com/positions.json?page=#{page}") { |f|
        listings = JSON.parse(f.read)
        listings.each { |listing|
          begin
            FoundJob.found_job("github" << listing['id'], listing['description'], listing['url'], listing['title'], listing['company'])
          rescue ActiveRecord::RecordNotUnique
            #We have already collected that listing
          end
        }
      }
      break if listings == []
      page += 1
    end
  end

  task :github_test => :environment do
    puts Listing.first.text
  end

  task :read_tags => :environment do
  	page = 1
  	loop do
  	  tags = nil
  	  max_count = nil
  	  open("http://api.stackoverflow.com/1.1/tags?pagesize=100&page=#{page}") { |f|
  	  	tags = JSON.parse(f.read)['tags']
  	  	tags.each{ |tag|
  	  		Skill.create(skill: tag['name'], count: tag['count'])
  	  		max_count = tag['count']
  	  	    puts tag['name']
  	  	}
  	  }
  	  break if tags == [] || max_count < 1000
  	  page += 1 
  	 end
  end
end