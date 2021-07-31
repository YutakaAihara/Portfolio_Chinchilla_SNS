class Public::QuestionCommentsController < ApplicationController
  before_action :authenticate_owner!
  def create
    @question = Question.find(params[:question_id])
    @question_comment = current_owner.question_comments.new(question_comment_params)
    @question_comment.question_id = @question.id
    @question_comment.save
  end
  
  def destroy
    @question = Question.find(params[:question_id])
    @question_comment = QuestionComment.find_by(id: params[:id], question_id: params[:question_id])
    @question_comment.destroy

  end
  
  private

  def question_comment_params
    params.require(:question_comment).permit(:comment)
  end
end
