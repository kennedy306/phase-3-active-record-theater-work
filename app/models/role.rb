class Role < ActiveRecord::Base
    has_many :auditions
    def actors 
      auditions.pluck(:actor).uniq
    end
    def locations
      auditions.pluck(:location).uniq
    end
    def lead
      hired_audition = auditions.find_by(hired: true)
      if hired_audition
        hired_audition.actor
      else
        'no actor has been hired for this role'
      end
    end
    def understudy
      hired_auditions = auditions.where(hired: true).limit(2)
      if hired_auditions.size >= 2
        hired_auditions.second.actor
      else
        'no actor has been hired for understudy for this role'
      end
    end
  end