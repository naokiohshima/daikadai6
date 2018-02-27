class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show,:edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
   @comment = @event.comments.build
   @comments = @event.comments
   @favorite = current_user.favorites.find_by(event_id: @event.id)
   Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end

  def new
    if params[:back]
     @event = Event.new(events_params)
    else
     @event = Event.new
    end
  end

  def create
    @event = Event.new(events_params)
    @event.user_id = current_user.id
    if @event.save
     redirect_to events_path, notice: "イベントを作成しました！"
     NoticeMailer.sendmail_event(@event).deliver
    else
     render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(events_params)
     redirect_to events_path, notice: "イベントを更新しました！"
    else
     render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, notice: "イベントを削除しました！"
  end

  def confirm
    @event = Event.new(events_params)
    render :new if @event.invalid?
  end

  private
    def events_params
      params.require(:event).permit(:title, :content)
    end

    def set_event
      @event = Event.find(params[:id])
    end
end
