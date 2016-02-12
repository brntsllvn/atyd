class AddImgToComic < ActiveRecord::Migration
  def change
    add_column :comics, :pic, :string
  end
end
