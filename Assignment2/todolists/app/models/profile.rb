class Profile < ActiveRecord::Base
  belongs_to :user

  validate :name_valid, :valid_gender, :not_a_boy_named_sue

  def name_valid
    if first_name.nil? and last_name.nil?
      errors.add(:first_name, "Bad")
      errors.add(:last_name, "Bad")
    end
  end

  def valid_gender
    errors.add(:gender, "Not a valid gender") unless !gender.nil? and (gender == "male" or gender == "female")
  end

  def not_a_boy_named_sue
    errors.add(:gender, "No boys named Sue") if !gender.nil? and !first_name.nil? and (gender == "male" and first_name.downcase == "sue")
  end

  scope :get_all_profiles, -> (startYear, endYear){where("birth_year between ? and ?", startYear, endYear).order("birth_year ASC")}

end
