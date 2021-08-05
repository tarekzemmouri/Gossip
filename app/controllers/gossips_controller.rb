class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:index]
  def index
    @gossips = Gossip.all
    
   
  end
  
  def new
    @gossips = Gossip.new
  end 


  def create
    
    @gossips = Gossip.new(gossip_params)
    @gossips.user = User.find_by(id: session[:user_id])
    
    if @gossips.save
      flash[:success] = "Potin bien créé ! "
      redirect_to gossips_path
    else
      
      render :new
    end
  
  end


  def show
    @gossips = Gossip.find(params[:id])
    @date = @gossips.created_at.to_date
  end

  def edit
    @gossips = Gossip.find(params[:id])
  end
  
  def update
    @gossips = Gossip.find(params[:id])
    @gossips.update(gossip_params)
    redirect_to gossips_path, notice: "Ton potin à été modifier ;)"
  end

  def delete 
    @gossips = Gossip.find(params[:id])
    @gossips.destroy(gossip_params)
    redirect_to gossips_path, notice: "Votre potin à été supprimer ;)"
  end

  def team

  end

  def contact
  end


private
  def gossip_params
    params.permit(:title,:content,:user_id)
  end 
  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
