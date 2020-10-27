class UpdatePoll < ActiveRecord::Migration[5.2]
  def change

    rename_column :polls, :author, :author_id

  end
end
