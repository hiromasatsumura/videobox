class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string          :username
      t.string          :email
      t.string          :password
      t.text            :profile_pic
      t.datetime        :date
      t.timestamps
    end
  end
end
