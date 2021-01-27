class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :logo_image
      t.integer :amount
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
