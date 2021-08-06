class Public::CommunitiesController < ApplicationController
  before_action :move_to_signed_in
  before_action :ensure_owner, only: [:edit, :update, :destroy]
  
  def index
    @communities = Community.page(params[:page]).reverse_order
    
    @recommends = Post.order("RANDOM()").limit(6)
  end
  
  def new
    @community = Community.new
    @community.owners << current_owner
    @recommends = Post.order("RANDOM()").limit(6)
  end
  
  def create
    @community = Community.new(community_params)
    @community.reader_id = current_owner.id
    if @community.save
      flash[:notice] = "コミュニティを作りました！"
      redirect_to community_path(@community)
    else
      render :new
    end
  end
  
  def show
    @community = Community.find(params[:id])
    @recommends = Post.order("RANDOM()").limit(6)
    @owners = @community.owners.all
  end
  
  def edit
    @community = Community.find(params[:id])
    @recommends = Post.order("RANDOM()").limit(6)
  end
  
  def update
    @community = Community.find(params[:id])
    if @community.update(community_params)
      flash[:notice] = "コミュニティの情報を更新しました！"
      redirect_to community_path(@community)
    else
      render :edit
    end
  end
  
  def destroy
    @community = Community.find(params[:id])
    @community.destroy
    redirect_to communities_path
  end
  
  private
  
  def community_params
    params.require(:community).permit(:name, :introduction, :image, owner_ids: [])
  end
  
  def move_to_signed_in
    unless owner_signed_in?
      redirect_to  'home'
    end
  end
  
  def ensure_owner
    @community = Community.find(params[:id])
    redirect_to community_path(@community) unless @community.reader_id == current_owner.id
  end
end
