class AddSubscriptionsCountToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :subscriptions_count, :integer, default: 0

    Photo.reset_column_information
    Photo.all.each do |p|
      Photo.update_counters p.id, :subscriptions_count => p.subscriptions.length
    end
  end
end
