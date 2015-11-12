class Interest < ActiveRecord::Base
  serialize :significant_names, Array
  belongs_to :interest_catogory
end
