class PlacesController < ApplicationController
 
  protect_from_forgery with: :exception
  before_action :authenticate_user!,except: [:index, :show]
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
      # if current_user
      #  # @places=current_user.places
      # else
        @places = Place.all
      end
      #end

  # GET /places/1
  # GET /places/1.json
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit

  end
def my_favorite
  @places=current_user.places
end
def favorite
 
    # User.find(current_user.id).places << Place.find(params[:id])
    #   flash[:notice] = 'Event was saved.'
    
    current_user.favorites.create({ place_id: params[:id]})
#@favorite=Favorite.new(user_id: 'dddd', place_id: 'tttt')
#@favorite.save

  #  @rec=Place.find(params[:id])
  #   if @rec.favorite == true 
  #     @rec.favorite=false
  #     else
  #       @rec.favorite=true
  #   end
  
  #   @rec.save
  #  @place.update(place_params)
    redirect_to show_place_path(params[:id])
  end
  def unfavorite 

     @favorites = current_user.favorites.where({ place_id: params[:id]})[0]
     @favorites.destroy
    #  User.find(current_user.id).places << Place.find(params[:id])
    # @place.destroy
    redirect_to places_path(params[:id])
    
end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)
    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:country, :city, :catogry, :name, :visit, :favorite)
    end


   
end
