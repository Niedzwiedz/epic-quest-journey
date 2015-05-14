require 'rails_helper'

RSpec.describe "quests/new", :type => :view do
  before(:each) do
    assign(:quest, Quest.new())
  end

  it "renders new quest form" do
    render

    assert_select "form[action=?][method=?]", quests_path, "post" do
    end
  end
end
