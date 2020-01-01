class AddAttributesToEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :done, :boolean
  end
end
