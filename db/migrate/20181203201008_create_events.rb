class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user
      t.string :image_url
      t.string :description
      t.string :title
      t.datetime :date

      t.timestamps
    end
  end
end
