require 'spec_helper'

describe "UI" do

  describe "index page" do

    it "should have the title 'Home'" do
      visit '/ui/index'
      page.should have_selector('title',
                               text: "Home | Patients")
    end
  end
end
