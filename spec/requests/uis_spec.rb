require 'spec_helper'

describe "UI" do

  describe "index page" do

    it "should have the title 'Home'" do
      visit '/ui/index'
      page.should have_selector('title',
                               text: "Home | Patients")
    end
  end

  describe "sign up page" do

    it "should have the title 'Sign Up'" do
      visit '/ui/sign_up'
      page.should have_selector('title',
                               text: "Sign Up | Patients")
    end
  end

  describe "log in page" do

    it "should have the title 'Log In'" do
      visit '/ui/log_in'
      page.should have_selector('title',
                               text: "Log In | Patients")
    end
  end
end
