require 'rails_helper'

RSpec.describe "quests/show", :type => :view do
  before(:each) do
    @quest = assign(:quest, Quest.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
