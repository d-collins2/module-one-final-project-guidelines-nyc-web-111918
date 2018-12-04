class CreateInjuries < ActiveRecord::Migration[5.2]
  def change
    create_table :injuries do |t|
      t.string :name
      t.integer :athlete_id
      t.integer :event_id
    end
  end
end
