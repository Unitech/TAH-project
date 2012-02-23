class ApplicationController < ActionController::Base
  protect_from_forgery
  
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
