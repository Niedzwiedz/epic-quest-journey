class Quest < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :name, :difficulty, :deadline
    validates_length_of :name, :minimum => 3
    #znajdowanie Questow ktore powinny byc przeniesione do nieukonczonych
	def self.current
		Quest.where("state LIKE ? AND deadline >= ? ", "current", Date.today)
	end
	def self.unfinished
		Quest.where("state LIKE ? AND deadline <= ?", "unfinished", Date.today)
	end
	def self.finished
		Quest.where("state LIKE ? ", "finished")
	end
	def self.failed
		Quest.where("state LIKE ? AND deadline <= ?", "current", Date.today)
	end
	def self.unsynced
		Quest.where("state LIKE ? AND deadline < ?", "current", Date.today)
	end
end
