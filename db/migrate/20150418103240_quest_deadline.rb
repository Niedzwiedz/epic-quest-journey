class QuestDeadline < ActiveRecord::Migration
  def up
        add_column :quests, :deadline, :date
  end
  def down
        remove_column :quests, :deadline
  end
end
