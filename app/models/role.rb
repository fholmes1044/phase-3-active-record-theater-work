class Role < ActiveRecord::Base
    has_many :auditions

    def actors 
        self.auditions.map do |t|
            t.actor
        end 
    end

    def locations 
        self.auditions.map do |t|
            t.location
        end 
    end

    def lead 
        self.auditions.find_by hired: true
    end 

    def understudy
        hired = self.auditions.where(hired: true)

        if hired[1]
            hired[1]
        else 
            'no actor has been hired for understudy for this role'
        end
    end
end