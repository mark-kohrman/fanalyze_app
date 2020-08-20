class AddingTheActualForeignKeyRelationPlayerIdToPerformances < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :performances, :players
  end
end
