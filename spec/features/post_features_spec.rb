require "spec_helper"

describe "PostFeatures" do 
  let(:post) { Post.make! }

  before { post }

  it "should render posts" do 
    visit posts_path
    page.should have_content post.title
  end

  context "anyone should be able to create post" do 
    it "should allow user to create new post" do 
      visit new_post_path
      within "#new_post" do 
        fill_in "post_title", with: "Title of a new post"
        fill_in "post_body", with: "Body of new Post"
        click_button "Create Post"
      end
      page.should have_content "Title of a new post"
    end
  end
end