class AddCategoryAndStatusToArticle < ActiveRecord::Migration
    def change
      add_column :articles, :status_id, :integer
      add_column :articles, :category_id, :integer
    end
end
