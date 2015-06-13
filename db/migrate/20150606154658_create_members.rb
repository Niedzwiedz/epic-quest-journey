class CreateMembers < ActiveRecord::Migration
	def change
		create_table :members do |t|
			t.integer :guild_id
			t.integer :user_id
			t.boolean :leader

			t.timestamps null: false
		end
	end
end
