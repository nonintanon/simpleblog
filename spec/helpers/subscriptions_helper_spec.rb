require 'spec_helper'

describe SubscriptionsHelper do
  let(:subscription)        { Subscription.make!(:photo) }
  let(:user)                { subscription.user }
  let(:photo)               { subscription.subscribable }
  let(:user_not_subscribed) { User.make! }

  context "#subscribe_button_for" do 
    describe "when user has subscribed" do 
      before { sign_in user }

      it "should render unsubscribe button" do 
        helper.subscribe_button_for(photo).should include "Unsubscribe"
      end
    end

    describe "when user has not subscribed" do 
      before { sign_in user_not_subscribed }

      it "should render subscribe button" do 
        helper.subscribe_button_for(photo).should include "Subscribe"
      end
    end
  end
end