class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :cast_id,  null: false
      t.integer :year_id,  null: false
      t.integer :genre_id, null: false
      t.string  :title,    index: true
      t.text    :summary,  null: false
      t.text    :jacket_image_id
      t.timestamps
    end
  end
end
