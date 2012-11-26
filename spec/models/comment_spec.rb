require 'spec_helper'

describe Comment do 
  let(:subscription)    { Subscription.make!(:photo) }
  let(:user)            { subscription.user }
  let(:photo)           { subscription.subscribable }
  let(:commenting_user) { User.make! } 

  it "should send notification to :user" do 
    comment = photo.comments.build(body: "fdslkdkflsklfds")
    comment.user = commenting_user
    NotificationsMailer.any_instance
                       .should_receive(:comment_notification)
                       .with(user, comment).once
    comment.save
  end 
end