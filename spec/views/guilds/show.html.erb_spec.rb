require 'rails_helper'

RSpec.describe "guilds/show", :type => :view do
  before(:each) do
    @guild = assign(:guild, Guild.create!(
      :name => "Name",
      :leader_id => 1,
      :motto => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
