class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body

  has_many :photos, order: "photos.subscriptions_count DESC"
  has_many :comments
  has_many :subscriptions
  has_many :subscribed_photos, 
           through: :subscriptions, 
           source:  :subscribable_photo

  has_many :subscribed_posts, 
           through: :subscriptions, 
           source: :subscribable_post

  def to_s
    name.present? ? name : email
  end

  def subscription_for resource
    subscriptions.where{(subscribable_type.eq resource.class.name) & 
                        (subscribable_id.eq resource.id)}.first
  end
end
