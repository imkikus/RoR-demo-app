class PagesController < ApplicationController
	def home
		
	end

	def pages_calculator
		@result = params[:a].to_i * params[:b].to_i
	end

	def render_demo
		render :home
	end
end
