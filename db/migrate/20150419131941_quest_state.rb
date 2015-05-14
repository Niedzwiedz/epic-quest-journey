class QuestState < ActiveRecord::Migration
  def up
    add_column :quests, :state, :string, null: false, default: "current"
  end
  def down
    remove_column :quests, :state
  end
end
