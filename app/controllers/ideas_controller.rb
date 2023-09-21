class IdeasController < ApplicationController
    def index
        @ideas=Idea.order("created_at DESC").paginate(:page=>params[:page], :per_page=>3)
    end
    def create
        #@idea=Idea.create(description: params[:idea][:description], author:params[:idea][:author])
        #Same as above
        @idea = Idea.create(idea_params)
        if @idea.valid?
            #implement later
            flash[:success]="Your idea has been posted"
        else
            #implement later
            flash[:alert]="Oops! Looks like there has been an error!"
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
            flash[:success]="Your idea has been posted"
            redirect_to root_path
        else
            flash[:alert]="Oops! Looks like there has been an error!"
            redirect_to edit_idea_path(params[:id])
        end
    end
    def destroy
        @idea = Idea.find(params[:id])
        @idea.destroy
        flash[:success] = "The idea was successfully deleted!"
        redirect_to root_path
    end


    private
    def idea_params
        params.require(:idea).permit(:description, :author)
    end

end
