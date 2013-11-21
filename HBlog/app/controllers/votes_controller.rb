class VotesController < ApplicationController

before_action :authenticate_user!, except: [:index, :show]

	def create
	    @post = Post.find params[:post_id]
	    @post.votes.create(direction: params[:direction])
	 
	    render json: { id: @post.id, votes: @post.votes_total }
	end

end