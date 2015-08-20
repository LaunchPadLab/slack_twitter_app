class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   "provider"
      t.string   "uid"
      t.string   "name"
      t.string   "screen_name"
      t.string   "image_url"
      t.string   "access_token"
      t.string   "secret_access_token"

      t.timestamps null: false
    end
  end
end
