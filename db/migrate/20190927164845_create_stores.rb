class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name 
      t.string :location
      t.belongs_to :currency, foreign_key: true
      t.belongs_to :game, foreign_key: true


      t.timestamps
    end
  end
end
