class IdeasController < ApplicationController
    def index
        @ideas=Idea.all
    end
    def create
        #@idea=Idea.create(description: params[:idea][:description], author:params[:idea][:author])
        #Same as above
        @idea = Idea.create(idea_params)
        if @idea.valid?
            #implement later
        else
            #implement later
        end
        #You can redirect users to a certain page in your application with redirect_to.
        redirect_to root_path
    end
    def edit
        @idea = Idea.find(params[:id])
    end

    def update
        @idea = Idea.find(params[:id])
        if @idea.update(idea_params)
          redirect_to root_path
        else
          redirect_to edit_idea_path(params[:id])
        end
    end
    def destroy
        @idea = Idea.find(params[:id])
        @idea.destroy
        redirect_to root_path
    end


    private
    def idea_params
        params.require(:idea).permit(:description, :author)
    end

end
