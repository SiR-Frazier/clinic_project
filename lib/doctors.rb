class Doctor
  attr_reader(:name, :id, :specialty)

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
    @specialty = attributes[:specialty]
  end

  def self.all
    doctors = []
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      specialty = doctor.fetch("specialty")
      id = doctor.fetch("id").to_i
      doctors.push(Doctor.new({:name => name, :id => id, :specialty => specialty}))
    end
    doctors
  end

  def save
      result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_doctor)
    (self.name==(another_doctor.name)).&(self.id ==(another_doctor.id)).&(self.specialty.==(another_doctor.specialty))
  end

  def self.find(id)
    found_doctor = nil
    Doctor.all().each() do |doctor|
      # binding.pry
      if doctor.id().==(id)
        found_doctor = doctor
      end
    end
    found_doctor
  end

  def patients

  end

end
