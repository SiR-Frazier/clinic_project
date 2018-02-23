require("spec_helper")

describe(Doctor) do
  describe(".all") do
    it("starts off with 0 doctors") do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds doctor to the doctors' array") do
      new_doctor = Doctor.new({:name => "Dr. Smith", :id => nil, :specialty => "chiropractic"})
      new_doctor.save()
      expect(Doctor.all()).to(eq([new_doctor]))
    end
  end

  def ==(another_doctor)
    self.name().==(another_doctor.name()).&(self.id).==(another_doctor.id()).&(self.specialty).==(another_doctor.specialty())
  end

  describe("#find")do
    it("returns a doctor by their id") do
      doctor1 = Doctor.new({:name => "Dr. Williams", :id => nil, :specialty => "dermatology"})
      doctor1.save()
      doctor2 = Doctor.new({:name => "Dr. Stanley", :id => nil, :specialty => "cardiology"})
      doctor2.save()
      expect(Doctor.find(doctor1.id())).to(eq(doctor1))
    end
  end

  describe("#id") do
    it("returns a doctor by their id") do
      doctor1 = Doctor.new(:name => "Dr. Anderson", :id => nil, :specialty => "gynecologist")
      doctor1.save()
      expect(doctor1.id()).to(be_an_instance_of(Integer))
    end
  end

end
