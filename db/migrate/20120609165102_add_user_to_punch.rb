# NOTE: Inicio
class AddUserToPunch < ActiveRecord::Migration
  def self.up
    add_column :punches, :created_by_id, :integer
  end

  def self.down
    remove_column :punches, :created_by_id
  end
end
# NOTE: Fim