class BloggersController < ApplicationController
    before_action :find_user, only: [:show]

def new
    @blogger = Blogger.new
end

    def create
        @blogger = Blogger.create(blogger_params)
        if @blogger.valid?
            redirect_to blogger_path(@blogger.id)
        else
            flash[:errors] = @blogger.errors.full_messages
            redirect_to new_blogger_path   
        end
    end

    def show
    end


    private
    def find_user
        @blogger = Blogger.find(params[:id])
    end

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end

end
