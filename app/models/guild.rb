class Guild < ActiveRecord::Base
	has_many :members
	has_many :users, through: :members 
    	validates_presence_of :name
    	validates_length_of :name, :minimum => 4
end
