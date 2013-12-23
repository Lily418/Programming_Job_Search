require 'spec_helper'
require 'find_skills'
require 'set'

describe "find_skills_in_text_method" do
 
  it "should extract the correct tags" do
     file = File.open("spec/lib/job_description.txt", "r")
     job_description = file.read
     skills = FindSkills.find_skills(job_description)
     expect(skills).to eq(Set.new ["Scala", "Java"])
     file.close
  end
end
