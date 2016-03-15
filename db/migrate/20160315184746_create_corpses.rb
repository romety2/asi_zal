class CreateCorpses < ActiveRecord::Migration[5.0]
  def change
    create_table :corpses do |t|
      t.string :first_name
      t.string :last_name
      t.string :pesel
      t.string :date_of_birth
      t.string :date_of_death

      t.timestamps
    end
  end
end
