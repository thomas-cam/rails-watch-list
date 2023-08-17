class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end
  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @bookmark.save
    redirect_to list_path(@list)
  end
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_path
  end
  def index
    @bookmarks = Bookmark.all
  end
  def show
    @bookmark = Bookmark.find(params[:id])
    @bookmarks = list.bookmark
  end

  private

  def bookmark_params
    params.require(:list).permit(:movie, :comment)
  end
end
