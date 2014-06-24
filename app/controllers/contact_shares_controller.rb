class ContactSharesController < ApplicationController

  def create
    contact_share = ContactShare.new(cs_params)
    if contact_share.save
      render :json => contact_share
    else
      render :json => 
          contact_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    contact_share = ContactShare.find(params[:id])
    contact_share.destroy
    render :json => contact_share
  end

  def edit
    render :json => {params[:id] => "we will implement this later"}
  end

  def index
    contact_shares = ContactShare.where("user_id = ?", cs_params[:user_id])
    render :json => contact_shares
  end

  def new
    contact_share = ContactShare.new(cs_params)
    render :json => contact_share
  end

  def show
    contact_share = ContactShare.find(cs_params)
    render :json => contact_share
  end

  def update
    contact_share = ContactShare.find(cs_params[:id])
    if contact_share.update_attributes(cs_params)
      render json: contact_share
    else
      render json: contact_share.errors.full_messages
    end
  end

  private
    def cs_params
      params.require(:contact_share).require(:user_id, :contact_id)
    end
end
