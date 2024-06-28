class AdminController < ApplicationController
  before_action :authenticate_user! # Ensures the user is logged in
  before_action :verify_admin
  
  def index
    @curated_compositions = CuratedComposition.all
  end

  private

  def verify_admin
    redirect_to root_path unless current_user&.admin?
  end
end
