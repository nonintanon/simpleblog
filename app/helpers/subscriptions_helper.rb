module SubscriptionsHelper
  def subscribe_button_for resource
    subscription = current_user.subscription_for(resource)
    if subscription
      link_to "Unsubscribe", 
        polymorphic_path([resource, subscription]), 
          method: :delete, class: 'btn btn-primary pull-right'
    else
      link_to "Subscribe", 
        polymorphic_path([resource, Subscription]), 
          method: :post, class: 'btn pull-right'
    end
  end
end