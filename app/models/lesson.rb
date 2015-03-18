class Lesson < ActiveRecord::Base
  belongs_to :chapter
  validates :name, :presence => true
  validates :content, :presence => true
  validates :number, :presence => true

  def next

    if self.number == Lesson.last.number
      next_lesson = Lesson.last
      return next_lesson
    else
      next_id = (self.number) + 1
      next_lesson = Lesson.find_by(:number => next_id)

      return next_lesson
    end
  end

    def prev

      if self.number == Lesson.first.number
        prev_lesson = Lesson.first
        return prev_lesson
      else
        prev_id = (self.number) - 1
        prev_lesson = Lesson.find_by(:number => prev_id)
        return prev_lesson
      end
    end

  end
