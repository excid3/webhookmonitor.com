class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :token, index: true
      t.integer :events_count, :integer, default: 0

      t.timestamps
    end
  end
end
