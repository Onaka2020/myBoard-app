class PostsController < ApplicationController
  before_action :set_post, only: [:reply,:new ,:show, :edit, :update, :destroy]

  # POST /posts
  # POST /posts.json
  def new
     @post=Post.new
  end
  
  
  def create
     
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.new(post_params)
    

    max_num = @topic.posts.maximum(:post_number)
    max_num = 0  if max_num.blank?
    @post.post_number = max_num + 1
    if @post.content.match(/@(\d+)/).present?
        temp_rep = @post.content.match(/@(\d+)/)
        @post.reply = temp_rep[1]
        
    end
            

    respond_to do |format|
      if @post.save
        format.html { redirect_to @topic, notice: 'スレッドへの書き込みが完了しました！' }
        format.json { render :show, status: :created, location: @topic }
      else
        @topic = Topic.find(params[:topic_id])
        @posts = @topic.posts
        format.html { render "topics/show" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json


  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @post.destroy
     respond_to do |format|
      format.html { redirect_to @topic,  notice: '書き込みの削除が完了しました！'  }
      format.json { head :no_content }
    end
  end
  
  def reply
    
  end
   
  def show
    
    
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    
     def post_params
      params.require(:post).permit(:title, :text, :img, :remove_img)
  end
    def post_params
       params.require(:post).permit(:title, :text, :img)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:contributor, :content, :post_number)
    end
end
