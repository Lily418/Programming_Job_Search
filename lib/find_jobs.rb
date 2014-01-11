module FindJobs
  def self.find_matching_jobs(skills)
    

    matching_listings = {}

    skills.each { |skill|

      skill.listings.each { |listing|
        matching_listings[listing] ||= 0
        matching_listings[listing] += 1
      } if !skill.nil?
    }

    return matching_listings.keys.sort {|a,b| matching_listings[b]<=> matching_listings[a]}

  end
end