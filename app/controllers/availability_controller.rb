class AvailabilityController < ApplicationController
  before_filter :authenticate_user!
  # method defined in application_controller
  before_filter :table_belongs_to_user

  def create
    load_menu
    @availability = @menu.availabilities.create(:start => params[:start], :end => params[:end])
    render :json => { 
      :success => true, 
      :new_id => @availability.id 
    }
  end

  def read
  end

  def update
    load_menu
    @availability = @menu.availabilities.find(params[:id])
    @availability.update_attributes(:start => params[:start], 
                                    :end => params[:end])
    render :json => { 
      :success => true, 
      :new_id => @availability.id 
    }
  end

  def delete
    load_menu
    @menu.availabilities.find(params[:id]).delete
    render :json => { 
      :success => true
    }
  end

  protected
  def load_menu
    @menu = @table.menus.find(params[:menu_id], :include => :availabilities)
  end
end
