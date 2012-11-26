class AddProcessingToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :processing, :boolean, default: false
  end
end
