class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :short_title
      t.belongs_to :user, index:true
      t.text :description

      t.timestamps
    end
  end
end
