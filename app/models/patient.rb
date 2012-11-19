class Patient < ActiveRecord::Base
  has_and_belongs_to_many :location
  attr_accessible :birthdate, :first_name, :gender, :last_name, :middle_name, :status, :user_id, :view_count
  validates :first_name, :last_name, :status, :presence => true

  after_save :set_MR_number

  private
    def set_MR_number
      # refer to
      # http://stackoverflow.com/questions/632742/how-can-i-avoid-running-activerecord-callbacks
      p = Patient.find(self.id)
      #p.update_column(:medical_record_number, "MR<#{p.id}>")
      mrnum = "MR<#{p.id}>".rjust 6, '0'
      p.update_column(:medical_record_number, mrnum)
    end
end

