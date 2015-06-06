class QuestsController < ApplicationController
	before_action :authenticate_user!
	before_action :current_quests, only: [:index, :create]
	respond_to :html, :js
	before_action :set_quest, only: [:finish, :show, :edit, :update, :destroy]
	before_action :sync, only: [:index]
	before_action :exp_values, only: [:finish]
	# GET /quests
	# GET /quests.json

	# GET /quests/1
	# GET /quests/1.json
	def show
	end

	# GET /quests/new
	def new
		@quest = current_user.quests.new
	end

	# GET /quests/1/edit
	def edit
	end


	# POST /quests
	# POST /quests.json
	def create
		@quest = current_user.quests.new(quest_params)
		respond_to do |format|
			if @quest.save
				format.html { redirect_to @quest, notice: 'Quest was successfully created.' }
				format.json { render :show, status: :created, location: @quest }
			else
				format.html { render :new }
				format.json { render json: @quest.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /quests/1
	# PATCH/PUT /quests/1.json
	def update
		respond_to do |format|
			if @quest.update(quest_params)
				format.html { redirect_to @quest, notice: 'Quest was successfully updated.' }
				format.json { render :show, status: :ok, location: @quest }
			else
				format.html { render :edit }
				format.json { render json: @quest.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /quests/1
	# DELETE /quests/1.json
	def destroy
		@quest.destroy	
		respond_to do |format|
			format.html { redirect_to quests_url, notice: 'Quest was cancelled.' }
			format.json { head :no_content }
		end
	end
	def sync
		@quest= current_user.quests.unsynced
		@quest.update_all("state = 'unfinished'")
	end
	def finish
		if @quest.update_attribute(:state, 'finished')
			if @quest.difficulty=='easy'
				@exp_value=@easy
			end
			if @quest.difficulty=='normal'
				@exp_value=@normal
			end
			if @quest.difficulty=='epic'
				@exp_value=@epic
			end
			if @quest.difficulty=='legendary'
				@exp_value=@legendary
			end
			
			current_user.increment!(:experience, @exp_value)


			respond_to do |format|
				format.html { redirect_to quests_url, notice: "Congratulations on finishing your quest" }
				format.json { head :no_content }
			end
		end
	end

	private
	def current_quests
		@quests = current_user.quests.current
	end
	def exp_values
		@easy=10
		@normal=50
		@epic=100
		@legendary=300
	end
	# Use callbacks to share common setup or constraints between actions.
	def set_quest
		@quest = Quest.find(params[:id])
	end
	# Never trust parameters from the scary internet, only allow the white list through.
	def quest_params
		params.require(:quest).permit(:name, :description, :difficulty, :deadline, :state)
	end

end
