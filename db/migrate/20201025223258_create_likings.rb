class CreateLikings < ActiveRecord::Migration[6.0]
  def change
    create_table :likings do |t|
      t.belongs_to :liked_post, null: false, foreign_key: {to_table: :posts}, index: true
      t.belongs_to :liker, null: false, foreign_key: {to_table: :users}, index: true

      t.timestamps
    end
  end
end
