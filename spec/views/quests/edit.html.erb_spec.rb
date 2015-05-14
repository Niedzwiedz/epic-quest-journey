require 'rails_helper'

RSpec.describe "quests/edit", :type => :view do
  before(:each) do
    @quest = assign(:quest, Quest.create!())
  end

  it "renders the edit quest form" do
    render

    assert_select "form[action=?][method=?]", quest_path(@quest), "post" do
    end
  end
end
