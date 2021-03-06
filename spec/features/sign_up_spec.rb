RSpec.describe "Parent signing up for an account" do
  it "displays the sign up page" do
    visit root_path
    click_on "Sign up"

    expect(page).to have_title(/sign up/i)
  end

  context "with valid information" do
    it "allows a new account to be created" do
      visit root_path
      click_on "Sign up"

      fill_in "First name",   :with => "Andy"
      fill_in "Last name",    :with => "Pike"
      fill_in "Email",        :with => "me@here.com"
      fill_in "Password",     :with => "secret123"
      fill_in "Password confirmation", :with => "secret123"

      expect { click_on "Create Account" }.to change(Account, :count).by(1)
      expect(current_path).to eq(children_path)
      expect(page).to have_content(/signed up successfully/i)
    end
  end

  context "with invalid information" do
    it "displays errors" do
      visit root_path
      click_on "Sign up"

      fill_in "First name", :with => ""

      expect { click_on "Create Account" }.not_to change(Account, :count)
      expect(current_path).not_to eq(children_path)
      expect(page).to have_content(/can't be blank/i)
    end
  end
end
