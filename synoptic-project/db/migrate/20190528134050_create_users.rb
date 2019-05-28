class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :mobile
      t.string :employeeid

      t.timestamps
    end
  end
end
