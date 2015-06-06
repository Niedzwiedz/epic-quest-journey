class CreateGuilds < ActiveRecord::Migration
  def change
    create_table :guilds do |t|
      t.string :name, default: "", null: false
      t.integer :leader_id, default: "", null: false
      t.text :motto

      t.timestamps null: false
    end
  end
end
