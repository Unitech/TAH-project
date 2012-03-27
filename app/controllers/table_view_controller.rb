class TableViewController < ApplicationController
  def show
    @table = Table.find(params[:table_id])
  end
end
