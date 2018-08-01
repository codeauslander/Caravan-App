class Preference < ApplicationRecord
  belongs_to :user

  TYPES = [
    'Delay',
    'Safety',
    'Cleanliness',
    'Crowding',
    'Accessibility',
    'Staff',
    'Other',
  ]

  def type(index)
    TYPES["#{index}"]
  end

  def types
    return TYPES
  end

  def mask(binary_string)
    binary_string.to_i(2)
  end

  def unmask_issue_type
    issue_type.to_s(2).split('')
  end

  



  
end
