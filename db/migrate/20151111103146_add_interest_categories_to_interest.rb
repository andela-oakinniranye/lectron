class AddInterestCategoriesToInterest < ActiveRecord::Migration
  def change
    add_reference :interests, :interest_catogory, index: true
  end
end
