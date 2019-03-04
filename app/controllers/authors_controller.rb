class AuthorsController < ApplicationController

  def index
    @authors = Author.all
    render :index
  end

  def show
    find_author
    render :show
  end

  def new
    @author = Author.new
    render :new
  end

  def create
    @author = Author.new(author_params)
    if @author.save && @author.valid?
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def edit
    find_author
  end

  def update
    find_author
    if @author.update(author_params)
      redirect_to author_path(@author)
    else
      render :edit
  end

  def find_author
    @author = Author.find(params[:id])
  end

  private

  def author_params
    params.require(:author).permit(:name, :phone_number)
  end

end
