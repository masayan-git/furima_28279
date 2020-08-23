class RenameTransactionColumnToOrderers < ActiveRecord::Migration[6.0]
  def change
    rename_column :orderers, :transaction_id, :procedure_id
  end
end
