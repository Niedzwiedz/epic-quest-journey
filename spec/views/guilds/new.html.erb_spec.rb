require 'rails_helper'

RSpec.describe "guilds/new", :type => :view do
  before(:each) do
    assign(:guild, Guild.new(
      :name => "MyString",
      :leader_id => 1,
      :motto => "MyText"
    ))
  end

  it "renders new guild form" do
    render

    assert_select "form[action=?][method=?]", guilds_path, "post" do

      assert_select "input#guild_name[name=?]", "guild[name]"

      assert_select "input#guild_leader_id[name=?]", "guild[leader_id]"

      assert_select "textarea#guild_motto[name=?]", "guild[motto]"
    end
  end
end
