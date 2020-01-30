class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :content
      t.datetime :activity_date
      t.references :user, foreign_key: true
      t.references :lover, foreign_key: true

      t.timestamps
    end
  end
end
