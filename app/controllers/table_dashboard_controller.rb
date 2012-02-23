class TableDashboardController < ApplicationController
  before_filter :authenticate_user!
  # method in application_controller
  before_filter :table_belongs_to_user, :except => [:index, :create_new]

  def index
    @tables = current_user.tables
  end

  def create_new
    # Create default table
    current_user.tables.create :title => t('model.table.init_new_table'),
                               :description => t('model.table.init_descr')
    redirect_to :back, :notice => t('notifications.table_created')
  end

  def manage
  end

  def edit_table
  end

  def update_table
    if @table.update_attributes(params[:table])
      redirect_to table_dashboard_manage_path(@table)
    else
      throw 'Error unknown in update_table'
    end
  end

  def edit_availabilities
  end

  def update_availabilities
  end

end
