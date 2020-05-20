class BloggersController < ApplicationController
    def index
        @bloggers = Blogger.all
    end
    
    def new
    
    end
    
    def create
    
    end
    
    def edit
    
    end
    
    def update
    
    end
    
    def show
    @blogger = Blogger.find(params[:id])
    render :show
    end
    
    def destroy
    
    end
end
