class AddImagesToUsers < ActiveRecord::Migration
  def change
    add_column :comics, :images, :json
  end
end
