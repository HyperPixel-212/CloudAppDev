class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.string :publisher
      t.float :price

      t.timestamps
    end
  end
end
