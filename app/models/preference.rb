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

  # SL: Whenever we use string interpolation in Ruby, we are converting the
  # argument to a string. Since the object TYPES is an array, this means we are
  # trying to index into an array with a string. We can take a look at the
  # documentation for arrays to see what is valid: https://ruby-doc.org/core-2.3.0/Array.html#method-i-5B-5D
  def type(index)
    TYPES["#{index}"]
  end

  # SL: Ruby has implicit returns, so more often than not, you don't see the
  # "return" keyword used, unless it is strictly necessary.
  def types
    return TYPES
  end

  # SL: Nice use of to_i. I was not aware that we could pass a base to that
  # method: https://ruby-doc.org/core-2.3.0/String.html#method-i-to_i
  def mask(binary_string)
    binary_string.to_i(2)
  end

  # SL: If I am interpreting this correctly, it looks like what we are trying to
  # do is to store multiple issue types in the issue_type column. This is called
  # "database denormalization", and it can cause problems down the line. There
  # are other solutions to this:
  # - Create a new model, IssueType. A Preference can than have many issue types.
  # - At the database level, use an array for issue type, and store the actual
  # values instead of numbers: http://blog.plataformatec.com.br/2014/07/rails-4-and-postgresql-arrays/
  # We can discuss this more in person.
  def unmask_issue_type
    issue_type.to_s(2).split('')
  end

  



  
end
