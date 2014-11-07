class CreateChoiceUsers < ActiveRecord::Migration
  def change
    create_table :choice_users do |t|
      t.integer :choice_id
      t.integer :user_id
      t.integer :survey_id

      t.timestamps
    end
  end
end
