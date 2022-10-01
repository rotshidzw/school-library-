require_relative './person'

class Teacher < Person
  def initialize(age, _classroom, parent_permission, name = 'Unknown')
    super(age, parent_permission, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
