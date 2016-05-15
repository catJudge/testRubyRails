class AddNotNullToBlogs < ActiveRecord::Migration
  def change
    change_column_null :blogs, :title, false
    change_column_null :blogs, :text, false
    change_column_null :blogs, :user_id, false

    change_column_null :posts, :title, false
    change_column_null :posts, :text, false
    change_column_null :posts, :blog_id, false
    change_column_null :posts, :user_id, false

  end
end
