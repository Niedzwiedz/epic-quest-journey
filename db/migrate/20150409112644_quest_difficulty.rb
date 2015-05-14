class QuestDifficulty < ActiveRecord::Migration
  def up
    add_column :quests, :difficulty, :string, null: false, default: "normal"
  end
  def down
    remove_column :quests, :difficulty
  end
end
