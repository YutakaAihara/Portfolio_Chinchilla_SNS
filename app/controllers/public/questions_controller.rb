class Public::QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @question = Question.new
  end
  
  def create
    question = current_owner.questions.build(question_params)
    question.save
    redirect_to question_path(question)
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    question = Question.find(params[:id])
    question.update(question_params)
    redirect_to question_path(question)
  end
  
  def solved
    question = Question.find(params[:id])
    if question.solution_status == false
      question.update(solution_status: true)
    elsif question.solution_status == true
      question.update(solution_status: false)
    end
    redirect_to question_path(question)
  end
  
  private
  
  def question_params
    params.require(:question).permit(:question_title, :question_body, :solution_status, :owner_id, question_images_images: [])
  end
end
