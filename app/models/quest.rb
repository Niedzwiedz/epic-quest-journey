class Quest < ActiveRecord::Base
    validates_presence_of :name, :difficulty, :deadline
    validates_length_of :name, :minimum => 3
    #znajdowanie Questow ktore powinny byc przeniesione do nieukonczonych
	def self.current
		Quest.where("state LIKE ? AND deadline > ?", "current", Date.today)
	end
	
end
