class Doctor
  attr_reader(:name, :id, :specialty)

  def initalize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @specialty = attributes.fetch(:specialty)
  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      specialty = doctor.fetch("specialty")
      doctors.push(Doctor.new({:name => name, :id => id, :specialty => specialty}))
    end
    doctors
  end

  def save
    result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

end
