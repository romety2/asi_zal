class CreateTrups < ActiveRecord::Migration[5.0]
  def change
    create_table :trups do |t|
      t.string :imie
      t.string :nazwisko
      t.string :pesel
      t.date :data_urodzenia
      t.date :data_smierci

      t.timestamps
    end
  end
end
