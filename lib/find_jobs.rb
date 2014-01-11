module FindJobs
  def self.find_matching_jobs(skills)
    

    listings_occurences = {}

    skills.each { |skill|

      skill.listings.each { |listing|
        listings_occurences[listing] ||= 0
        listings_occurences[listing] += 1
      } if !skill.nil?
    }

    listings = listings_occurences.keys.sort {|a,b| listings_occurences[b]<=> listings_occurences[a]}
    
    matching_jobs = []
    listings.each { |listing| 
      matching_jobs << {job: listing, skills: listing.skills.order(count: :desc).limit(10)}
    }

    return matching_jobs

  end
end