class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.integer :date, limit: 8
      t.string :place
      t.string :duration
      t.integer :creator_id
      t.string :creator_type

      t.timestamps
    end
  end
end
