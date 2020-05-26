class ChangeZipToString < ActiveRecord::Migration[6.0]
  def change
    change_column :venues, :zip, :string
  end
end
