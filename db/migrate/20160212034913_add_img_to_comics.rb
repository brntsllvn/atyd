class AddImgToComics < ActiveRecord::Migration
  def change
    add_column :comics, :comic, :string
  end
end
