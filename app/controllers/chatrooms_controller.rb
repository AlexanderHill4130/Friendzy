class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show, :edit, :update, :destroy]

  # GET /chatrooms
  # GET /chatrooms.json
  def index
    @chatrooms = Chatroom.all
  end

  # GET /chatrooms/1
  # GET /chatrooms/1.json
  def show
    @messages = @chatroom.messages.order(created_at: :desc).limit(30).reverse
  end

  # GET /chatrooms/new
  def new
    @chatroom = Chatroom.new

  end

  # GET /chatrooms/1/edit
  def edit
  end

  # POST /chatrooms
  # POST /chatrooms.json
  def create
    # binding.pry
    place = Place.find(params[:place_id])
    place.chatrooms.each do |chatroom|
      if chatroom.users.include?(current_user)
        @chatroom = chatroom
        redirect_to place_chatroom_path(place, @chatroom)
        return
      end
    end

    @chatroom = place.chatrooms.create
    @chatroom.chatroom_users.create(user: current_user)
    redirect_to place_chatroom_path(place, @chatroom)

    # respond_to do |format|
    #   if @chatroom.save
    #     format.html { redirect_to @chatroom, notice: 'Chatroom was successfully created.' }
    #     format.json { render :show, status: :created, location: @chatroom }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @chatroom.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /chatrooms/1
  # PATCH/PUT /chatrooms/1.json
  def update
    respond_to do |format|
      if @chatroom.update(chatroom_params)
        format.html { redirect_to @chatroom, notice: 'Chatroom was successfully updated.' }
        format.json { render :show, status: :ok, location: @chatroom }
      else
        format.html { render :edit }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chatrooms/1
  # DELETE /chatrooms/1.json
  def destroy
    @chatroom.destroy
    respond_to do |format|
      format.html { redirect_to chatrooms_url, notice: 'Chatroom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_participant
    @chatroom = Chatroom.find(params[:chatroom_id])
    @chatroom.chatroom_users.create(user_id: params[:id])
    redirect_to place_chatroom_path(@chatroom.place, @chatroom)
  end

  def remove_participant
    @chatroom = Chatroom.find(params[:chatroom_id])
    @chatroom.chatroom_users.where(user_id: params[:id]).first.destroy
    redirect_to place_chatroom_path(@chatroom.place, @chatroom)
  end

  def user_chatrooms
    @chatrooms = current_user.chatrooms
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatroom
      @chatroom = Chatroom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def chatroom_params
    #   params.require(:chatroom).permit(:place_id)
    # end
end
