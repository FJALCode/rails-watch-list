class ListsController < ApplicationController
  # :new, :create, :show, :index
  before_action :set_list, only: %i[ show ]

  # GET /lists
  def index
    @lists = List.all
    p @lists
  end

  # GET /lists/:id
  def show
    @bookmark = Bookmark.new
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # POST /lists
  def create
    @list = List.new(list_params)
    respond_to do |format|
      if @list.save
        format.html { redirect_to list_path(@list), notice: "List was successfully created." }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
