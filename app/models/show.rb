class Show < ActiveRecord::Base
    has_many :characters
    has_many :actors, through: :characters
    belongs_to :network
  
    # Returns the characters associated with the show
    def characters
      Character.where(show_id: id)
    end
  
    # Returns the network that the show belongs to
    def network
      Network.find_by(id: network_id)
    end
  
    # Returns a list of the full names of each actor associated with the show
    def actors_list
      actors.pluck(:first_name, :last_name).map { |first_name, last_name| "#{first_name} #{last_name}" }
    end
end
  