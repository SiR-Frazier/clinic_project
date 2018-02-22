class Patient
  attr_reader(:name, :dob, :department_needed, :id, :doctor_id)

  def initalize(attributes)
    @name = attributes.fetch(:name)
    @dob = attributes.fetch(:dob)
    @department_needed = attributes.fetch(:department_needed)
    @id = attributes.fetch(:id)
    @doctor_id = attributes.fetch(:doctor_id)
  end

end
