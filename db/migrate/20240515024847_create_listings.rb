class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.string :address
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
