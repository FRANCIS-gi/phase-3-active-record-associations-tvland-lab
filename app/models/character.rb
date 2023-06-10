class Character < ActiveRecord::Base
    belongs_to :actor
    belongs_to :show
  
    # Validation for first_name, last_name, and catchphrase
    validates :first_name, :last_name, :catchphrase, presence: true
  
    # Returns the actor that the character belongs to
    def actor
      Actor.find_by(id: actor_id)
    end
  
    # Returns the show that the character belongs to
    def show
      Show.find_by(id: show_id)
    end
  
    # Returns a string with the character's name and catchphrase
    def say_that_thing_you_say
      "#{first_name} #{last_name} says: '#{catchphrase}'"
    end
end
  