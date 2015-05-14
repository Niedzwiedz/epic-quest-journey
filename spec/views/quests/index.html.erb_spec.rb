require 'rails_helper'

RSpec.describe "quests/index", :type => :view do
  before(:each) do
    assign(:quests, [
      Quest.create!(),
      Quest.create!()
    ])
  end

  it "renders a list of quests" do
    render
  end
end
