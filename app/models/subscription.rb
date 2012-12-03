class Subscription < ActiveRecord::Base
  attr_accessible :subscribable_id, :subscribable_type, :user_id

  belongs_to :user
  belongs_to :subscribable, polymorphic: true, counter_cache: true

  belongs_to :subscribable_photo, foreign_key: :subscribable_id, 
             class_name: "Photo", conditions: { subscriptions: { subscribable_type: "Photo" }}

  belongs_to :subscribable_post, foreign_key: :subscribable_id,
             class_name: "Post", conditions: { subscriptions: {subscribable_type: "Post"}}
end
