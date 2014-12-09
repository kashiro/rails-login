require 'rails_helper'

RSpec.describe "Authenticate pages", :type => :view do
  subject { page }

  describe "Signin pages" do
    before do
      visit signin_path
    end

    it { should have_content('Sign in') }
    it { should have_title('Sign in') }
  end
end

