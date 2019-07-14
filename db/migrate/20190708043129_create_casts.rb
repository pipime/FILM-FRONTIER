class CreateCasts < ActiveRecord::Migration[5.2]
  def change
    create_table :casts do |t|
      t.string :cast, null: false

      t.timestamps
    end
  end
end
