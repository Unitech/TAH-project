class TableDashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter :table_belongs_to_user, :except => [:index, :create_new]

  def index
    @tables = current_user.tables
  end

  def create_new
    # Create default table
    current_user.tables.create :title => t('model.table.init_new_table'),
                               :description => t('model.table.init_descr')
    redirect_to :back, :status => t('notification.table_created')
  end

  def manage
  end

  def edit_table
  end

  def update_table
  end

  def edit_menu
  end

  def update_menu
  end

  def edit_availabilities
  end

  def update_availabilities
  end

  protected
  def table_belongs_to_user
    begin
      @table = Table.find(params[:table_id])

      if @table.table_belongs_to_user? current_user 
        true
      else
        # Not the right user
        redirect_to root_path
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
      #
      # Handle redirect
      #
    end
  end
end
