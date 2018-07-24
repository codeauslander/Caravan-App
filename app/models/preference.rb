class Preference < ApplicationRecord
  belongs_to :user

  def issue_type_pretty
    issue_type.to_s(2).split('')
  end
  
end
