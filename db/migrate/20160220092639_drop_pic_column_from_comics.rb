class DropPicColumnFromComics < ActiveRecord::Migration
  def change
    remove_column :comics, :pic
  end
end
