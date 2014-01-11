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
    skills = Skill.where("skill LIKE ?", params['q'] + "%").order(count: :desc).limit(10)
    result = []
    skills.each { |skill|
      result << {id: skill.id, name:skill.skill}
    }

    respond_to do |format|
      format.json {render json: result}
    end

  end
end
