class AddComicIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :comic_id, :integer
  end
end
