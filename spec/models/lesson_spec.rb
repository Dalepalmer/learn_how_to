require 'rails_helper'

describe Lesson do
  it { should validate_presence_of :name }
  it { should validate_presence_of :content }
  it { should validate_presence_of :number }
  it { should belong_to :chapter }
  context '#next' do
    it 'returns the lesson with the next-highest number than the current lesson' do
      current_lesson = Lesson.create({:name => 'lesson1', :content => "lesson1", :number => 1})
      next_lesson = Lesson.create({:name => 'lesson2', :content => "lesson2", :number => 2})
      expect(current_lesson.next).to eq next_lesson
    end
  end

    context '#prev' do
      it 'returns the lesson with the next-lowest number than the current lesson' do
        current_lesson = Lesson.create({:name => 'lesson1', :content => "lesson1", :number => 2})
        previous_lesson = Lesson.create({:name => 'lesson2', :content => "lesson2", :number => 1})
        expect(current_lesson.prev).to eq previous_lesson
      end
  end
end
