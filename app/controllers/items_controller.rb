class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      items = user.items
    else 
      items = Item.all
    end
    render json: items, include: :user
  end
 
  def create
    item = Item.create.find(params[:id])
    render json: review, include: :user
  end
  private

  def record_not_found
    render json: { error: "User not found"}, status: :not_found
  end

end
