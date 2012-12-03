require 'spec_helper'

describe "PhotoFeatures" do 
  let(:photo) { Photo.make! }
  let(:user)  { User.make! }

  before { photo; user; login(user) }

  it "should render photos" do 
    visit photos_path
    page.should have_css("#photo_#{photo.id}")
  end

  it "should render photo show" do 
    visit photo_path(photo)
    page.should have_content photo.caption
    page.should have_css "#new_comment"
  end

  it "should allow user to comment on photo" do 
    visit photo_path(photo)
    within "#new_comment" do 
      fill_in "comment_body", with: "Test Comment"
      click_button "Create Comment"
    end
    page.should have_content "Test Comment"
  end
end