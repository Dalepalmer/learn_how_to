class AddNumberToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :number, :serial
  end
end
