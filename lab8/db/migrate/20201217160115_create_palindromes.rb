class CreatePalindromes < ActiveRecord::Migration[6.0]
  def change
    create_table :palindromes do |t|
      t.string :dec
      t.string :bin

      t.timestamps
    end
  end
end
