class BlogsController < ApplicationController
    skip_before_action :verify_authenticity_token # removes all protection for your routes

    def index
        # p request.params
        # p params #these two lines do the same thing
        render json: Blog.all
    end
    
    # CREATE
    def create
        blog = Blog.create!(title: params[:title], content: params[:content])
        render json: blog
    end

    def update
        # blog = Blog.find(params[:id]) # will just set blog to nil if not found
        blog = Blog.find_by!(id: params[:id]) # will throw a 404 if not found
        
        if blog.update(blog_params)
            render json: blog
        else
            render json: {error: blog.errors.full_messages}, status: 422
        end
    end

     def destroy
        blog = Blog.find_by!(id: params[:id])
        if blog.destroy
            render json: blog
        else
            render json: {error: blog.errors.full_messages}, status: 422
        end
    end

    

    private
    
    def blog_params
        # this is called whitelisting parameters
        params.permit(:title, :content)
    end


   
end
