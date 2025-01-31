class AuthorsController < ApplicationController
  def index
    @author = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def edit
    @post = Author.find(params[:id])    
  end 

  def create
    @author = Author.create(author_params)
    if @author.valid?
      @author.save
    redirect_to author_path(@author)
    else
      render :new
    end
  end

  def update
    @author = Author.new(author_params)
    if  @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      render :edit
    end 
  end 

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
