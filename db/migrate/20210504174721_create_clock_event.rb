class CreateClockEvent < ActiveRecord::Migration[5.2]
  def change
    create_table :clock_events do |t|
      t.references :user, foreign_key: true, index: true
      t.datetime :check_in
      t.datetime :check_out
    end
  end
end
