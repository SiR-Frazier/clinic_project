require("spec_helper")

describe(Doctor) do
  describe(".all") do
    it("starts off with no doctors") do
      expect(Doctor.all()).to(eq([]))
    end
  end
  
  describe("#save") do
    it("saves doctor to the list of doctors") do
      new_doctor = Doctor.new({:name => "Dr. Smith", :id => nil, :specialty => "chiropractic"})
      new_doctor.save()
      expect(Doctor.all()).to([doctors])
    end
  end

  def ==(another_doctor)
    self.name().==(another_doctor.name()).&(self.id).==(another_doctor.id()).&(self.specialty).==(another_doctor.specialty())
  end
end
