require 'rails_helper'

RSpec.describe "guilds/edit", :type => :view do
  before(:each) do
    @guild = assign(:guild, Guild.create!(
      :name => "MyString",
      :leader_id => 1,
      :motto => "MyText"
    ))
  end

  it "renders the edit guild form" do
    render

    assert_select "form[action=?][method=?]", guild_path(@guild), "post" do

      assert_select "input#guild_name[name=?]", "guild[name]"

      assert_select "input#guild_leader_id[name=?]", "guild[leader_id]"

      assert_select "textarea#guild_motto[name=?]", "guild[motto]"
    end
  end
end
