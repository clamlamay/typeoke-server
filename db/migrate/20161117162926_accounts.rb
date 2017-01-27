class Accounts < ActiveRecord::Migration[5.0]
  def change
	create_table :accounts do |table|
		table.string :username
		table.string :password
		table.string :api_key
		table.string :password_hash
		table.string :password_salt
	end
  end
end







