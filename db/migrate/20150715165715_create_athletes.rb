class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :name, null: false
      t.string :sport, null: false
      t.string :weight, null: false
      t.string :height, null: false
      t.string :personal_record, null: false
      t.date :retired_at

      t.timestamps null: false
    end
  end
end
