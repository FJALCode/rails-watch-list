class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[ destroy ]

  # GET /bookmarks/new
  def new
    @list = List.find(params[:list_id])
    @movies = Movie.all
    @bookmark = Bookmark.new
  end

  # POST /bookmarks or /bookmarks.json
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to list_path(@list), notice: "Bookmark was successfully created." }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1 or /bookmarks/1.json
  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to lists_path, notice: "Bookmark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end

# before_action :set_fernando, only: %i[ show edit update destroy ]

# # GET /fernandos or /fernandos.json
# def index
#   @fernandos = Fernando.all
# end

# # GET /fernandos/1 or /fernandos/1.json
# def show
# end

# # GET /fernandos/new
# def new
#   @fernando = Fernando.new
# end

# # GET /fernandos/1/edit
# def edit
# end

# # POST /fernandos or /fernandos.json
# def create
#   @fernando = Fernando.new(fernando_params)

#   respond_to do |format|
#     if @fernando.save
#       format.html { redirect_to @fernando, notice: "Fernando was successfully created." }
#       format.json { render :show, status: :created, location: @fernando }
#     else
#       format.html { render :new, status: :unprocessable_entity }
#       format.json { render json: @fernando.errors, status: :unprocessable_entity }
#     end
#   end
# end

# # PATCH/PUT /fernandos/1 or /fernandos/1.json
# def update
#   respond_to do |format|
#     if @fernando.update(fernando_params)
#       format.html { redirect_to @fernando, notice: "Fernando was successfully updated." }
#       format.json { render :show, status: :ok, location: @fernando }
#     else
#       format.html { render :edit, status: :unprocessable_entity }
#       format.json { render json: @fernando.errors, status: :unprocessable_entity }
#     end
#   end
# end

# # DELETE /fernandos/1 or /fernandos/1.json
# def destroy
#   @fernando.destroy
#   respond_to do |format|
#     format.html { redirect_to fernandos_url, notice: "Fernando was successfully destroyed." }
#     format.json { head :no_content }
#   end
# end

# private
#   # Use callbacks to share common setup or constraints between actions.
#   def set_fernando
#     @fernando = Fernando.find(params[:id])
#   end

#   # Only allow a list of trusted parameters through.
#   def fernando_params
#     params.require(:fernando).permit(:comment, :list_id, :movie_id)
#   end
