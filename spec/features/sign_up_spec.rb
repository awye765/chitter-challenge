feature "FEATURE: Sign up" do
  scenario "create new user on sign up" do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content("Welcome to Spitter, Solid Snake")
    expect(User.first.email).to eq('snake@mgs.com')
  end

  scenario "with a password that does not match" do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content  "Password and confirmation password do not match"
  end
end
