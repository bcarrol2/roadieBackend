class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :name
      t.string :title
      t.text :review_text
      t.date :date

      t.timestamps
    end
  end
end
