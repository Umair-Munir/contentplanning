class AddCreatedFlagToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :created_flag, :boolean, default false
  end
end
