class CreatePrograms < ActiveRecord::Migration[7.1]
  def change
    create_table :programs do |t|

      t.timestamps
    end
  end
end
