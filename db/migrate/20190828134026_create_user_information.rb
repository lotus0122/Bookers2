class CreateUserInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :user_informations do |t|
      t.string :name
      t.string :introduction
      t.string :profile_image_id
      t.timestamps
    end
  end
end
