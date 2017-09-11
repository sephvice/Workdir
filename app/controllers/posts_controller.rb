class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
     @posts = Post.order("created_at ASC")
     @posts = current_staff.posts
     @posts = Post.paginate(page: params[:page])
   end

   def show
     @post = Post.find(params[:id])
     @posts = current_staff.posts
     @comments = Comment.where(post_id: @post).order('created_at DESC')
   end

   def new
     @post = Post.new
     @post = current_staff.posts.build
   end

   def create
    #  @post = Post.new(post_params)
     @post = current_staff.posts.build(post_params)
     if @post.save
       redirect_to staffs_path, notice: "The post has been successfully created."
     else
       render action: "new"
     end
   end

   def edit
     @post = Post.find(params[:id])
   end

   def update
     @post = Post.find(params[:id])
     if @post.update_attributes(post_params)
       redirect_to staffs_path, notice: "The post has been successfully updated."
     else
       render action: "edit"
     end
   end

   def destroy
     @post.destroy
     respond_to do |format|
       format.html { redirect_to staffs_path, notice: 'Post was deleted.' }
       format.json { head :no_content }
     end
   end

 private

 def set_post
   @post = Post.find(params[:id])
 end

   def post_params
     params.require(:post).permit(:body, :staff_id, :page, :data_file_size, :data_file_name, :data_content_type, :type, :width, :height, :ckeditor_assets, :picture, :post_id, :comments, :body, :destroy)
   end
end
