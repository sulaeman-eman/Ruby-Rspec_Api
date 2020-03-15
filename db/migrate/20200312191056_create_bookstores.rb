class CreateBookstores < ActiveRecord::Migration[5.1]
  def change
    create_table :bookstores do |t|
      t.string :title
      t.string :deskrpsi

      t.timestamps
    end
  end
end
