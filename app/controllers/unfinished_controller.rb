class UnfinishedController < ApplicationController
	before_action :authenticate_user!
	before_action :set_unfinished, only: [:show, :destroy]

	def index
		@unfinished_qs= Quest.unfinished
	end

	def show
	end

	def edit
	end


	def destroy
		@unfinished.destroy
		respond_to do |format|
			format.html { redirect_to quests_url, notice: "Unfinished Quest was successfully destroyed." }
			format.json { head :no_content }
		end
	end

	private
		def set_unfinished
			@unfinished = Quest.find(params[:id])
		end	

		def unfinished_params
			params.require(:quest).permit(:name, :description, :difficulty, :deadline, :state)
		end
			
end
