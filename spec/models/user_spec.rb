require "spec_helper"

describe User do 
  it { should have_many(:subscriptions)}
  it { should have_many(:subscribed_photos).through(:subscriptions)} 
  it { should have_many(:subscribed_posts).through(:subscriptions)}

  context "User#to_s" do
    describe "should return name" do
      let(:user) { User.make! }
      subject { user }

      its(:to_s) { should eq user.name }
    end

    describe "should return email" do 
      let(:user) { User.make!(name: '')}
      subject { user } 

      its(:to_s) { should eq user.email }
    end
  end 

  context "User#subscription_for" do 
    let(:subscription)   { Subscription.make!(:photo) }
    let(:photo)          { subscription.subscribable }
    let(:user)           { subscription.user }
    subject              { user }

    it "should return the subscription for the object passed" do 
      subscription = subject.subscription_for(photo)
      subscription.should_not be_nil
      subscription.subscribable.should eq photo
      subscription.subscribable_type.should eq "Photo"
    end
  end 

end