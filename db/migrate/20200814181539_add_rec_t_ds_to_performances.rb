class AddRecTDsToPerformances < ActiveRecord::Migration[6.0]
  def change
    add_column :performances, :rec_tds, :integer
  end
end
