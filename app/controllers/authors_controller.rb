class AuthorsController < ApplicationController
  before_action :set_author, only: %i[show update destroy]
  def index
    @authors = Author.all
    render json: @authors, status: :ok
  end

  def show
    render json: @author, status: :ok
  end

  def create
    @author = Author.create(author_params)
    render json: @author, status: :created
  end

  def update
    @author.update(author_params)
    render json: @author, status: :ok
  end

  def destroy

    if Author.count > 1
      @author.update_talents
      @author.destroy
      render json: {message: "Author is successfully destroyed"}
    else
      render json:{error: "author is not able to destroy"}
    end
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :bio, :dob)
  end

  def set_author
    @author = Author.find(params[:id])
  end
end
