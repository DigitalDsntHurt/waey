class ChangeDescriptionColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :consumptions, :desciption, :description
  end
end
