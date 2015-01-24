class VintsController < ApplicationController
  # GET /vints
  # GET /vints.json
  def index
    @vints = Vint.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vints }
    end
  end

  # GET /vints/1
  # GET /vints/1.json
  def show
    @vint = Vint.find(params[:id])
    @address = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vint }
    end
  end

  # GET /vints/new
  # GET /vints/new.json
  def new
    @vint = Vint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vint }
    end
  end

  # GET /vints/1/edit
  def edit
    @vint = Vint.find(params[:id])
  end

  # POST /vints
  # POST /vints.json
  def create
    location = Location.new(:latitude =>params[:vint][:latitude], :longitude =>params[:vint][:longitude])
    location.save

    @vint = Vint.new(:app_id => params[:vint][:app_id], :descraption => params[:vint][:descraption], :title => params[:vint][:title], :video_url => params[:vint][:video_url])
    @vint.location_id = location.id
    respond_to do |format|
      if @vint.save
      puts "Helloooooooooooo" 
        render :status => 200, json: {ResponseCode: "200", TimeStamp: Time.now.to_i, Vint: @vint.inspect}
      else
        format.html { render action: "new" }
        format.json { render json: @vint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vints/1
  # PUT /vints/1.json
  def update
    @vint = Vint.find(params[:id])

    respond_to do |format|
      if @vint.update_attributes(params[:vint])
        format.html { redirect_to @vint, notice: 'Vint was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vints/1
  # DELETE /vints/1.json
  def destroy
    @vint = Vint.find(params[:id])
    @vint.destroy

    respond_to do |format|
      format.html { redirect_to vints_url }
      format.json { head :no_content }
    end
  end
end
