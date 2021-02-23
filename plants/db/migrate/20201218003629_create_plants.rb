class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.belongs_to :user, type: :string
      
      t.string :name
      t.integer :age
      t.integer :height
      t.integer :winter_frequency
      t.integer :spring_frequency
      t.integer :summer_frequency
      t.integer :autumn_frequency

      t.timestamps
    end
  end
end
