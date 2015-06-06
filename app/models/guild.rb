class Guild < ActiveRecord::Base
	has_many :users
    	validates_presence_of :name
    	validates_length_of :name, :minimum => 4
end
