class AddReconfirmableToDevise < ActiveRecord::Migration[5.1]
  def up

    add_column :users, :unconfirmed_email, :string # Only if using reconfirmable
    # To avoid a short time window between running the migration and updating all existing
    # users as confirmed, do the following
    User.all.update_all confirmed_at: DateTime.now
  end

  def down
    remove_columns :users, :unconfirmed_email # Only if using reconfirmable
  end
end
