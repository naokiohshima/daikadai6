class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @event = @comment.event
    @notification = @comment.notifications.build(user_id: @event.user.id )
    respond_to do |format|
      if @comment.save
       format.html { redirect_to event_path(@event), notice: 'コメントを投稿しました。' }
       format.js { render :index }
       unless @comment.event.user_id == current_user.id
         Pusher.trigger("user_#{@comment.event.user_id}_channel", 'comment_created', {
            message: 'あなたの作成した日記にコメントが付きました'
          })
       end
       Pusher.trigger("user_#{@comment.event.user_id}_channel", 'notification_created', {
          unread_counts: Notification.where(user_id: @comment.event.user.id, read: false).count
        })
      else
        format.html { render :new }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:event_id, :content)
    end
end
