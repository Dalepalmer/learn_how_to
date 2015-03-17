class LessonsController < ApplicationController

  def new
    @chapter = Chapter.find(params[:chapter_id])
    @lesson = @chapter.lessons.new
  end

  def create
    @chapter = Chapter.find(params[:chapter_id])
    @lesson = @chapter.lessons.new(lesson_params)
    if @lesson.save
      flash[:notice] = "Lesson successfully saved!"
      redirect_to chapter_path(@lesson.chapter)
    else
      render :new
    end
  end

  def edit
    @chapter = Chapter.find(params[:chapter_id])
    @lesson = @chapter.lessons.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      flash[:notice] = "Lesson successfully updated!"
      redirect_to chapter_path(@lesson.chapter)
    else
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
  if @lesson.destroy
    flash[:notice] = "Lesson deleted"
  end
    redirect_to chapter_path(@lesson.chapter)
  end

  def show
    @lesson = Lesson.find(params[:id])
    @chapter = Chapter.find(params[:chapter_id])
  end

  def next
    @lesson = Lesson.find(params[:id])
    @nextlesson = Lesson.find(params[:id = @lesson.id+1])
    return @nextlesson
  end

private
  def lesson_params
    params.require(:lesson).permit(:name, :content)
  end
end
