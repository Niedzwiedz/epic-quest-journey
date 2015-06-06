class QuestOwner < ActiveRecord::Migration
  def up
	  add_column :quests, :user_id, :integer
  end
  def down
	  remove_column :quests, :user_id
  end
end
