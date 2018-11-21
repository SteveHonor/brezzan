class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.references :event, foreign_key: true
      t.string :name
      t.text :cover_photo_data
    end
  end
end
