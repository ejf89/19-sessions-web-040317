class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.date :dob
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
