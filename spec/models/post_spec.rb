require 'spec_helper'

describe Post do 
  it { should allow_mass_assignment_of(:body)}
  it { should allow_mass_assignment_of(:title)}

  it { should have_many(:comments) }
  it { should have_many(:subscriptions)}
  it { should have_many(:subscribers).through(:subscriptions)}
end