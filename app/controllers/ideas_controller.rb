class IdeasController < ApplicationController
    def index
        @ideas=Idea.all
    end
    def create
        #@idea=Idea.create(description: params[:idea][:description], author:params[:idea][:author])
        #Same as above
        @idea = Idea.create(idea_params)
        #You can redirect users to a certain page in your application with redirect_to.
        redirect_to root_path
    end

    private
    def idea_params
        params.require(:idea).permit(:description, :author)
    end

end
