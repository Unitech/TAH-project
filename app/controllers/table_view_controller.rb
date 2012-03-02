class TableViewController < ApplicationController
  def table_sample
  end

  def show
    @table = Table.find(params[:table_id])
  end
end
