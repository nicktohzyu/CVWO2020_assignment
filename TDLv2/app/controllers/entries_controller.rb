class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /entries
  # GET /entries.json
  def index
    @user = current_user.id
    @entries = Entry.where(user_id: current_user.id)
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end
  # def show
  #   @entry = Entry.find(params[:id])
  # end
  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
    unless current_user.id == @entry.user_id
      flash[:notice] = 'Error: That entry doesn\'t belong to you!'
      redirect_to entries_url
    end
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = current_user.entries.build(entry_params)
    @entry.done = false #set to false by default
    respond_to do |format|
      if @entry.save
        format.html { redirect_to entries_path(@entry), notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_done
    #puts "test"
    @entry = Entry.find(params[:entry_id])
    @entry.update(done: !@entry.done)
    redirect_to entries_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:content, :due_date, :user_id)
    end
end
