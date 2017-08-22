class UsersController < InheritedResources::Base
before_action :set_post, only: [:show, :edit, :destroy, :update]
before_action :configure_permitted_parameters, if: :devise_controller?

  private

    def user_params
      params.require(:user).permit(:current_user)
    end

    def index
      @users = User.all
      @posts = current_user.posts
      binding.pry
    end

    def show
      render :layout => nil
    end

    def new
      @posts = post.new
    end

    def destroy
      @posts.destroy
      respond_to do |format|
        format.html { redirect_to post_url, notice: 'Post have successfuly deleted.' }
        format.json { head :no_content }
      end
    end

    def edit
      respond_to do |format|
        if @users.update(post_params)
          format.html { redirect_to post_url, notice: "Your post have been updated." }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @posts.errors, status: :unprocessable_entity }
        end
      end
    end

    def create
      @posts = Post.new(post_params)
      @posts.user = current_user
      respond_to do |format|
        if @posts.save
        format.html {redirect_to @posts, notice: 'Your post have successfuly created.' }
        format.json {render action: 'show', status: :created, location: @posts}
      else
        format.html {render action: 'new' }
        format.json {render json: @posts.errors, status: :unprocessable_entity}
      end
    end
  end
end
