class AddDateTakenToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :date_taken, :date
  end
end
