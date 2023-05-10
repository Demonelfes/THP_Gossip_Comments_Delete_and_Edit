class GossipController < ApplicationController

  def index
    @all_gossips = Gossip.all
    @all_users = User.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new('user_id' => User.all.sample.id,
                   'title' => params[:title],
                   'content' => params[:content])
    params[:tag_ids].each do |tag_id|
      @gossip.intertags.build(tag_id: tag_id)
    end
    if @gossip.save
      redirect_to root_path(post_success: true)
    else
      render :new
    end
  end

  def edit
    @current_gossip = Gossip.find(params[:id].to_i)
  end

  def show
    @current_gossip = Gossip.find(params[:id].to_i)
  end

  def update
    @current_gossip = Gossip.find(params[:id].to_i)
    gossip_params = params.permit(:title, :content)
    #@current_gossip.update(gossip_params)
    if @current_gossip.update(gossip_params)
      redirect_to root_path(edit_success: true)
    else
      render :edit
    end
  end

  def destroy
    @current_gossip = Gossip.find(params[:id].to_i)
    @current_gossip.destroy
    if @current_gossip.destroy
      redirect_to root_path(destroy_success: true)
    else
      render :show
    end
  end
end
