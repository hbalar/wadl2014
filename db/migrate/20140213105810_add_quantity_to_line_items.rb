class AddQuantityToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :quantiy, :integer, :default => 1

  end
end
