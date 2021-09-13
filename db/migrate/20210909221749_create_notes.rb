class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.text :body
      t.references :user, null: false

      t.timestamps
    end
  end
end
