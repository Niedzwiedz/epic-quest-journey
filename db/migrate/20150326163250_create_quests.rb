class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.timestamps null: false
    end
  end
end
