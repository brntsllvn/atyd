class AddVerticalImageToComics < ActiveRecord::Migration
  def change
    add_column :comics, :vertical_image, :string
  end
end
