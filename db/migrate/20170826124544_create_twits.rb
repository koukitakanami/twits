class CreateTwits < ActiveRecord::Migration
  def change
    create_table :twits do |t|
      t.text :content


      t.timestamps null: false
    end
  end
end
