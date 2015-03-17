class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all
  end

  def new
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.new(chapter_params)
    if @chapter.save
      flash[:notice] = "Chapter successfully saved!"
      redirect_to chapters_path
    else
      render :new
    end
  end

  def show
    @chapter = Chapter.find(params[:id])
  end

  def edit
    @chapter = Chapter.find(params[:id])
  end

  def update
    @chapter = Chapter.find(params[:id])
    if @chapter.update(chapter_params)
      flash[:notice] = "Chapter successfully updated!"
      redirect_to chapters_path
    else
      render :edit
    end
  end

  def destroy
    @chapter = Chapter.find(params[:id])
    if @chapter.destroy
      flash[:alert] = "Chapter successfully deleted!"
    end
    redirect_to chapters_path
  end

private
  def chapter_params
    params.require(:chapter).permit(:name)
  end
end
