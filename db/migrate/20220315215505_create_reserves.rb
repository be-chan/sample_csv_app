class CreateReserves < ActiveRecord::Migration[6.0]
  def change
    create_table :reserves do |t|
      t.string :reserce_date
      t.string :name
      t.string :note
      t.timestamps
    end
  end
end
