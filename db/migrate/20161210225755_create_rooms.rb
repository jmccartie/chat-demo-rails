class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms, id: :bigserial do |t|
      t.timestamps
    end
  end
end
