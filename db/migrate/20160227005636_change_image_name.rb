class ChangeImageName < ActiveRecord::Migration
  def change
    remove_column :comics, :images
    add_column :comics, :horizontal_image, :string
  end
end
