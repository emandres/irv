class AuthorizationsController < ApplicationController
  before_filter :insert_authorization_into_params, only: :create
  
  # Trick to make posting from button_to easier for the index view
  def insert_authorization_into_params
    unless params[:authorization]
      if params[:user_id] && params[:role_id]
        params[:authorization] = { 
          user_id: params[:user_id], 
          role_id: params[:role_id] 
        }
      end
    end
  end
  
  def index
    @authorizations = Authorization.where("user_id = ?", params[:user_id]).
      includes(:role).
      order('"roles"."name"')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authorizations }
    end
  end

  def create
    @authorization = Authorization.new(params[:authorization])

    respond_to do |format|
      if @authorization.save
        format.html { redirect_to user_authorizations_path(params[:user_id]), notice: 'Authorization was successfully created.' }
        format.json { render json: @authorization, status: :created, location: @authorization }
      else
        format.html { render action: "new" }
        format.json { render json: @authorization.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @authorization = Authorization.find(params[:id])
    @authorization.destroy

    respond_to do |format|
      format.html { redirect_to user_authorizations_url(params[:user_id]) }
      format.json { head :no_content }
    end
  end
end
