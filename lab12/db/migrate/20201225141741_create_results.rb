class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :n
      t.string :result

      t.timestamps
    end

    add_index :results, :n, unique: true
  end
end
