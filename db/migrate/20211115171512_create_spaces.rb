class CreateSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.string :title
      t.string :type
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
