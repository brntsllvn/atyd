class DropBogusId < ActiveRecord::Migration
  def change
    drop_column :comics, :comic_id
  end
end
