class Comment < ApplicationRecord


  belongs_to :visitor, optional: true

  belongs_to :group, optional: true

  belongs_to :parent,  class_name: "Comment", optional: true

  has_many   :replies, class_name: "Comment", foreign_key: :parent_id

  # has_many   :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy


 





  private

  def add_user

   @user = User.find_by_email(@comment.name)

         if @user

            @user.id = @comment.user_id 

            @comment.save

         end
      
        

    end



end
