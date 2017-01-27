class Points < ActiveRecord::Migration[5.0]
  def change
  	create_table :points do |table|
  		table.integer :score
  		table.string :username, foreign_key: :account
  	end
  end
end
