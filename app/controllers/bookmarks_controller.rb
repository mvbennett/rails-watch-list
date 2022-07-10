class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  def create
    movie = Movie.find(params[:bookmark][:movie_id])
    list = List.find(params[:list_id])
    bookmark = Bookmark.new(bookmark_params)
    bookmark.list = list
    bookmark.movie = movie
    bookmark.save

    redirect_to list_path(list)
  end

  def destroy
    list = List.find(params[:list_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to list_path(list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
