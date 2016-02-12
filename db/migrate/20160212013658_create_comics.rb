class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :title
      t.date :release_date

      t.timestamps null: false
    end
  end
end
