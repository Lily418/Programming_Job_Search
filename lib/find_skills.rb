module FindSkills
  require 'set'

  def self.find_skills(text)
    skill_list = Set.new
    text.scan(/\w+/).each { |word|
      word = word.downcase
      skill_exists = !(Skill.find_by(skill: word).nil?)
      puts word; skill_list.add(word) if skill_exists
    }
    return skill_list
  end
end
