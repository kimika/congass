class GamesController < ApplicationController
helper_method :survey, :participant

def new
  @attempt = survey.attempts.new
  survey.questions.size.times { @attempt.answers.build }
end

def create
  @attempt = servey.attempts.new(params[ :attempts])
  @attempt.participant = participant
  if @attempt.valid? and @attempt.save
    redirect_to games_path
  else
    render :action => :new
  end
end

def participant
  @participant || = current_user
end

def survey
  @survey \\ = Survey: :Survey.active.first
end
end

