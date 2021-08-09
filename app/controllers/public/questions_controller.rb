class Public::QuestionsController < ApplicationController
  before_action :move_to_signed_in
  before_action :ensure_owner, only: [:edit, :update]
  
  def index
    @questions = Question.page(params[:page]).reverse_order
    @question = Question.new
    @recommends = Post.order("RANDOM()").limit(6)
    @same_prefecture_owners = Owner.where.not(id: current_owner.id).where(prefecture: current_owner.prefecture).limit(3)
  end
  
  def create
    @question = current_owner.questions.build(question_params)
    if @question.save
      flash[:notice] = "相談を投稿しました！"
      redirect_to question_path(@question)
    else
    @recommends = Post.order("RANDOM()").limit(6)
    @same_prefecture_owners = Owner.where.not(id: current_owner.id).where(prefecture: current_owner.prefecture).limit(3)
      @questions = Question.all
      render :index
    end
  end

  def show
    @question = Question.find(params[:id])
    @question_comment = QuestionComment.new
    @recommends = Post.order("RANDOM()").limit(6)
    @same_prefecture_owners = Owner.where.not(id: current_owner.id).where(prefecture: current_owner.prefecture).limit(3)
  end

  def edit
    @recommends = Post.order("RANDOM()").limit(6)
    @same_prefecture_owners = Owner.where.not(id: current_owner.id).where(prefecture: current_owner.prefecture).limit(3)
  end
  
  def update
    if @question.update(question_params)
      flash[:notice] = "相談の更新に成功しました！"
      redirect_to question_path(question)
    else
      @recommends = Post.order("RANDOM()").limit(6)
      @same_prefecture_owners = Owner.where.not(id: current_owner.id).where(prefecture: current_owner.prefecture).limit(3)
      render :edit
    end
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
  def move_to_signed_in
    unless owner_signed_in?
      redirect_to  'home'
    end
  end
  
  def ensure_owner
    @question = Question.find(params[:id])
    redirect_to owner_path(current_owner) unless @question.owner == current_owner
  end
end
