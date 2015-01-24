class CreateVints < ActiveRecord::Migration
  def change
    create_table :vints do |t|
      t.string :title
      t.string :descraption
      t.integer :location_id
      t.integer :app_id
      t.string :video_url

      t.timestamps
    end
  end
end
