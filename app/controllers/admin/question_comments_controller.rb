class Admin::QuestionCommentsController < ApplicationController
    before_action :authenticate_admin!
  def destroy
    QuestionComment.find_by(id: params[:id], question_id: params[:question_id]).destroy
    redirect_to admin_questions_path
  end
end
