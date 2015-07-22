class CardtimesController < ApplicationController
  before_action :set_cardtime, only: [:show, :edit, :update, :destroy]
  
  def import
    x = params[:file]
    # render :text => x.path
    # return
    Cardtime.delete_all
    Cardtime.import(params[:file])
    redirect_to cardtimes_path, notice: "#{Cardtime.count}Products imported."
  end

  # GET /cardtimes
  # GET /cardtimes.json
  def index
    @cardtimes = Cardtime.first 10
  end

  # GET /cardtimes/1
  # GET /cardtimes/1.json
  def show
  end

  # GET /cardtimes/new
  def new
    @cardtime = Cardtime.new
  end

  # GET /cardtimes/1/edit
  def edit
  end

  # POST /cardtimes
  # POST /cardtimes.json
  def create
    @cardtime = Cardtime.new(cardtime_params)

    respond_to do |format|
      if @cardtime.save
        format.html { redirect_to @cardtime, notice: 'Cardtime was successfully created.' }
        format.json { render :show, status: :created, location: @cardtime }
      else
        format.html { render :new }
        format.json { render json: @cardtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cardtimes/1
  # PATCH/PUT /cardtimes/1.json
  def update
    respond_to do |format|
      if @cardtime.update(cardtime_params)
        format.html { redirect_to @cardtime, notice: 'Cardtime was successfully updated.' }
        format.json { render :show, status: :ok, location: @cardtime }
      else
        format.html { render :edit }
        format.json { render json: @cardtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cardtimes/1
  # DELETE /cardtimes/1.json
  def destroy
    @cardtime.destroy
    respond_to do |format|
      format.html { redirect_to cardtimes_url, notice: 'Cardtime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cardtime
      @cardtime = Cardtime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cardtime_params
      params.require(:cardtime).permit(:ou_id, :cardno, :cardtime, :up_data)
    end
end
