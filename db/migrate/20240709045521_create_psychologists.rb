class CreatePsychologists < ActiveRecord::Migration[7.1]
  def change
    create_table :psychologists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :specialization
      t.text :insurance_accepted
      t.integer :years_of_experience

      t.timestamps
    end
  end
end
