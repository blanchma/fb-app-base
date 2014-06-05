class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :uid
      t.string :token
      t.datetime :token_expires_at
      t.timestamps
    end
  end
end
