class CreateHeroes < ActiveRecord::Migration[7.2]
  def change
    create_table :heroes do |t|
      t.string :name

      t.timestamps
    end
  end
end
