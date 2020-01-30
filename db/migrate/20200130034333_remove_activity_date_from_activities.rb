class RemoveActivityDateFromActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :acitivity_date, :date
  end
end
