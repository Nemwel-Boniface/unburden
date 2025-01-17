# frozen_string_literal: true

class DeviseCreatePsychologists < ActiveRecord::Migration[7.1]
  def change
    create_table :psychologists do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
      
      # Other properties
      t.string :first_name,              null: false
      t.string :last_name,              null: false
      t.string :location,              null: false
      t.string :phone_number,              null: false
      # t.string :user_photo,              null: false
      t.text :bio
      t.string :specialization, default: "Heart Breaks"
      t.text :insurance_accepted, default: "yes"
      t.integer :years_of_experience, default: 0



      t.timestamps null: false
    end

    add_index :psychologists, :email,                unique: true
    add_index :psychologists, :reset_password_token, unique: true
    # add_index :psychologists, :confirmation_token,   unique: true
    # add_index :psychologists, :unlock_token,         unique: true
  end
end
