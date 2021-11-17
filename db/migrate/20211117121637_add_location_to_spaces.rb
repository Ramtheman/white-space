class AddLocationToSpaces < ActiveRecord::Migration[6.0]
  def change
    add_column :spaces, :location, :string
  end
end
