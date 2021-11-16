class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :spaces, :type, :space_type
  end
end
