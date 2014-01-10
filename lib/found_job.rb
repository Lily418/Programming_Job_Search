require 'set'

module FoundJob
  def self.found_job(id, job_desc, url)
  	listing = Listing.create(text: job_desc, id_source: id, url: url)
  	skills = find_skills(job_desc)
    listing.skills = skills
  	
  	
  end


  def self.find_skills(text)
    skill_list = Set.new
    text = text.downcase
    Skill.all.each { |skill|
      position = /(\s|\(|,|\/)#{Regexp.quote(skill.skill.downcase.gsub('-',' '))}(\s|\)|,|\/)/ =~ text
      skill_list.add(skill) if position != nil
    }
    return skill_list.to_a
  end

end