class RemoveContentFromActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :content, :string
  end
end
