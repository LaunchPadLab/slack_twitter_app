class AddSlackTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :slack_token, :string
  end
end
