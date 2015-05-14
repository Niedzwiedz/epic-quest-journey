class QuestDescription < ActiveRecord::Migration
  def up
    add_column :quests, :description, :string, default: "" 
  end
  def down
    remove_column :quests, :description
  end
end
