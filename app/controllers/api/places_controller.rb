class Api::PlacesController < ApplicationController
  def index
    @place = Place.all
    render "index.json.jb"
  end

  def show
    place_id = params[:id]
    @place = Place.find(place_id)
    render "show.json.jb"
  end

  def create
    @place = Place.new(
      name: params[:name],
      address: params[:address],
    )

    #happy/sad path
    if @place.save
      render "show.json.jb"             #happy path
    else
      render json: { errors: @place.errors.full_messages }, status: 406                       #sad path
    end
  end

  def update
    @place = Place.find_by(id: params[:id])

    @place.name = params[:name] || @place.name
    @place.address = params[:address] || @place.address

    #happy/sad path
    if @place.save
      render "show.json.jb"             #happy path
    else
      render json: { errors: @place.errors.full_messages }, status: 406                       #sad path
    end
  end

  def destroy
    @place = Place.find_by(id: params[:id])

    if @place.destroy
      render json: { message: "deleted place" }
    else
      render json: { errors: @place.errors.full_messages }, status: 406                       #sad path
    end
  end
end
