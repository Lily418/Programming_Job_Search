class WelcomeController < ApplicationController
  def index

    skill_ids = []

    params[:skills].each { |id|
      skill_ids << Skill.find_by(id: id)
    }

    matching_jobs = FindJobs.find_matching_jobs(skill_ids) 

    

  	respond_to do |format|
      format.json {render json: matching_jobs}
    end
  end

  def tagsearch
    query = params['q'].strip.downcase
    #skills = Skill.joins(:listings).distinct.where("skill LIKE ?", params['q'].strip.downcase + "%").order(count: :desc).limit(10)
    skills = Skill.find_by_sql(["(SELECT id,skill,count, 0 AS x FROM skills WHERE skill=?) 
                                UNION (SELECT DISTINCT ON (skills.id) skills.id,skill,count, 1 AS x FROM skills 
                                INNER JOIN skill_listing_links ON skills.id=skill_listing_links.skill_id WHERE skill LIKE ? AND skill != ?) 
                                ORDER BY x, count DESC LIMIT 10", query, query + "%", query])
    result = []
    skills.each { |skill|
      result << {id: skill.id, name:skill.skill}
    }

    respond_to do |format|
      format.json {render json: result}
    end

  end
end
