class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.belongs_to :project, null: false, foreign_key: true
      t.string :content_type
      t.jsonb :body
      t.jsonb :headers

      t.timestamps
    end
  end
end
