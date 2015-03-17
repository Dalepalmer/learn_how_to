class Lesson < ActiveRecord::Base
  belongs_to :chapter
  validates :name, :presence => true
  validates :content, :presence => true
  validates :number, :presence => true

  def next
    next_id = (self.number) + 1
    next_lesson = Lesson.find_by(:number => next_id)

    return next_lesson
  end

  def prev
    prev_id = self.number - 1
    prev_lesson = Lesson.find_by(:number => prev_id)

    return prev_lesson
  end

end
