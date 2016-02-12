class DropMisplacedComicField < ActiveRecord::Migration
  def change
    remove_column :comics, :comic
  end
end
