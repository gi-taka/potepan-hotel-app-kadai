class RoomsController < ApplicationController
  def index
  end

  def show
    @room = Room.find_by(id: params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :room_introduction, :fee, :address, :image))
    if @room.save
      redirect_to "/rooms/#{@room.id}"
    else
      render "/rooms/new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    if params[:area]
      @rooms = Room.where("address like ?", "%#{params[:area]}%")
    elsif params[:keyword]
      @rooms = Room.where("address like ? OR name like ? OR room_introduction like ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    end
  end
end
