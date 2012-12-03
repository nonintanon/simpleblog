require 'spec_helper'

describe PhotosController do 
  render_views
  let(:photo) { Photo.make! }
  let(:user)  { User.make! }

  before { sign_in user }

  it "should render json for photo" do 
    get :show, id: photo.id, format: :json
    %w[caption processing].each do |field|
      response.body.should have_json_path(field)
    end
  end 
end