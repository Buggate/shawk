class CommentsController < ApplicationController



	   

     before_action :find_visitor


     before_action :find_group


    before_action :find_parent




    

  
  def create

    if @group != nil

       @comment = @group.comments.build(comment_params) 

        @comment.save

        redirect_to group_path(@group)

     else @visitor

       @comment = @visitor.comments.build(comment_params) 

        @comment.save    

        redirect_to visitor_path(@visitor) 

    end

  end


  


  def destroy
    

   
    @comment.destroy


    redirect_to visitor_path(@visitor)

  end




  private

  def comment_params

    params.require(:comment).permit(:name, :body, :visitor_id, :group_id, :parent_id)

  end

  def find_group

      if params[:group_id]

         @group = Group.find(params[:group_id])

      end
  end


  def find_visitor

      if params[:visitor_id]

         @visitor = Visitor.find(params[:visitor_id])

      end
  end


  def find_parent

      if params[:parent_id]

         @parent = Comment.find(params[:parent_id])

      end
  end


  def all_comments

    @comment = @group.comments

  end

end
