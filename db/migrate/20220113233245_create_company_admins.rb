class CreateCompanyAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :company_admins do |t|
      t.references :admin, null: false
      t.references :company, null: false

      t.timestamps
    end
    
    add_foreign_key :company_admins, :users, column: :admin_id
    add_foreign_key :company_admins, :companies, column: :company_id
  end
end
