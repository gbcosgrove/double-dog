module DoubleDog
  class Session
    attr_reader :id, :employee_id, :items

    def initialize(id, user_id)
      @id = id
      @user_id = user_id
    end
  end
end
