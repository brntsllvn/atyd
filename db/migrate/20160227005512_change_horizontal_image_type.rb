class ChangeHorizontalImageType < ActiveRecord::Migration
  def change
    change_column :comics, :images, :string
  end
end
