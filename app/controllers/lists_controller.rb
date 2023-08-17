class ListsController < ApplicationController
  def index
    @lists = List.all
  end
  def new
    @list = List.new
  end
  def show
    @list = List.find(params[:id]) # 1, 2, 3 ,4
    @bookmarks = @list.bookmarks
  end
  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list)
  end
  def list_params
    params.require(:list).permit(:name)
  end
end
