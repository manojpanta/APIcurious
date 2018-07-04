class RemoveColumnFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :oauth_token_secret
    add_column :users, :user_name, :string
  end
end
