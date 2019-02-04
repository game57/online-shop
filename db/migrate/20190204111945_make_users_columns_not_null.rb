class MakeUsersColumnsNotNull < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      User.reset_column_information
      dir.up do
        User.where(email: nil).update_all(email: "dummy@game57.com")
        User.where(password_digest: nil).update_all(password_digest: "dummy_password")
      end
      dir.down do
        User.where(email: "dummy@game57.com").update_all(email: nil)
        User.where(password_digest: "dummy_password").update_all(password_digest: nil)
      end
    end

    change_column_null :users, :email, false
    change_column_null :users, :password_digest, false
  end
end
