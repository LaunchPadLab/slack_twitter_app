class AddTeamDomainToUsers < ActiveRecord::Migration
  def change
    add_column :users, :team_domain, :string
  end
end
