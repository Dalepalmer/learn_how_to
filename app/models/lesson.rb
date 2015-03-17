class Lesson < ActiveRecord::Base
  belongs_to :chapter
  validates :name, :presence => true
  validates :content, :presence => true

  def next
    @lesson = Lesson.find(:id)
    @nextlesson = @lesson.id + 1
    return @nextlesson
  end

end
