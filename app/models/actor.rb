class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters
  
    def characters_list
      characters.pluck(:name)
    end
  
    def shows_list
      shows.pluck(:name)
    end
  
    def full_name
      "#{first_name} #{last_name}"
    end
  
    def list_roles
      characters.map { |character| "#{character.name} - #{character.show.name}" }
    end
end
  