class MembersController < ApplicationController
	before_action :authenticate_user!
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
	  @user = current_user
	  @guild = @user.guilds.first

	  @members = @guild.users.all
  end

  # GET /members/1
  # GET /members/1.json

  # GET /members/new
  def new
	  if current_user.members.first.leader == true
    @member = Member.new
	  else
		redirect_to members_url, notice: 'You dont have rights to do it' 
	  end
  end
  # GET /members/1/edit

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
	@member.guild_id = current_user.guilds.first.id
	@member.leader=false
    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
    # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:user_id)
    end
end
