module AuthMacros
  def login(user)
    visit new_user_session_path
    within "#new_user" do 
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_button "Sign in"
    end
  end
end