class AddStripeSubsTokenToCotisations < ActiveRecord::Migration[5.2]
  def change
    add_column :cotisations, :stripe_subs_token, :string
  end
end
