class NameQuest < ActiveRecord::Migration
  def up
    add_column :quests, :name, :string, null: false, default: ""
  end
  def down
    remove_column :quests, :name
  end
end
