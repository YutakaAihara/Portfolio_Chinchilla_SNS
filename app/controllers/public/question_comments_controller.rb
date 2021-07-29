class Public::QuestionCommentsController < ApplicationController
  before_action :authenticate_owner!
  def create
    question = Question.find(params[:question_id])
    comment = current_owner.question_comments.new(question_comment_params)
    comment.question_id = question.id
    comment.save
    redirect_to question_path(question)
  end
  
  def destroy
    QuestionComment.find_by(id: params[:id], question_id: params[:question_id]).destroy
    redirect_to question_path(params[:question_id])
  end
  
  private

  def question_comment_params
    params.require(:question_comment).permit(:comment)
  end
end
