require 'rails_helper'

RSpec.describe "user page", :type => :view do
  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      visit user_path(user)
    end

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "singup page" do
    before do
      visit signup_path
    end

    let(:submit) { "Create my account" }

    it { should have_content('Sign up') }
    it { should have_title('Sign up') }

    describe "with invalid information" do
      it "should not create account" do
        expect{ click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        # fill_in(${label_value}, with: ${input_value})
        fill_in('Name', with: "Example User")
        fill_in('Email', with: "user@example.com")
        fill_in('Password', with: 'foobar')
        fill_in('Confirmation', with: 'foobar')
      end
      it "should create account" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end
