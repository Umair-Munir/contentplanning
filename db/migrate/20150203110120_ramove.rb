class Ramove < ActiveRecord::Migration
  def change
    remove_column :articles, :short_title
  end
end
