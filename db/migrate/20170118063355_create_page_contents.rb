class CreatePageContents < ActiveRecord::Migration[5.0]
  def change
    create_table :page_contents do |t|
      t.string :url
      t.text :data

      t.timestamps
    end
  end
end
