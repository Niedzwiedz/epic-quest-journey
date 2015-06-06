class GuildIdToUsers < ActiveRecord::Migration
  def up
	add_column :users, :guild_id, :integer
  end
  def down
	remove_column :users, :guild_id
  end
end
