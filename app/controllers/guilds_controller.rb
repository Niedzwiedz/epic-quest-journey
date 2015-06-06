class GuildsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_guild, only: [:show, :edit, :update, :destroy, :set_leader_group_id]
	#	after_action :set_leader_group_id, only: [:create]

	# GET /guilds
	# GET /guilds.json

	# GET /guilds/1
	# GET /guilds/1.json
	def show
	end

	# GET /guilds/new
	def new
		@guild = Guild.new
	end

	# GET /guilds/1/edit
	def edit
	end

	# POST /guilds
	# POST /guilds.json
	def create
		if current_user.guild_id.nil?
			@guild = Guild.new(guild_params)
			@guild.leader_id = current_user.id
			respond_to do |format|
				if @guild.save
					self.set_leader_group_id
					format.html { redirect_to quests_path, notice: 'Guild was successfully created.' }
					format.json { render :show, status: :created, location: @guild }
				else
					format.html { render :new }
					format.json { render json: @guild.errors, status: :unprocessable_entity }
				end
			end
		else
			redirect_to quests_path, notice: "You cannot belong to two guilds"
		end
	end

	# PATCH/PUT /guilds/1
	# PATCH/PUT /guilds/1.json
	def update
		respond_to do |format|
			if @guild.update(guild_params)
				format.html { redirect_to @guild, notice: 'Guild was successfully updated.' }
				format.json { render :show, status: :ok, location: @guild }
			else
				format.html { render :edit }
				format.json { render json: @guild.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /guilds/1
	# DELETE /guilds/1.json
	def destroy
		@guild.destroy
		respond_to do |format|
			format.html { redirect_to guilds_url, notice: 'Guild was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_guild
		@guild = Guild.find(params[:id])
		get_leader
		get_members
	end
	def get_leader
		@leader = User.find(@guild.leader_id)
	end	
	def get_members
		@guild_members = User.where("guild_id = ?", @guild.id)
	end
	def set_leader_group_id
		current_user.guild_id = @guild.id
		current_user.save
	end
	# Never trust parameters from the scary internet, only allow the white list through.
	def guild_params
		params.require(:guild).permit(:name, :motto)
	end
end
