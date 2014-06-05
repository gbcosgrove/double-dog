require 'pry-debugger'

module DoubleDog
  def self.db
    @__db_instance ||= Database::InMemory.new
  end
end


require_relative 'double_dog/modules/admin_session.rb'
require_relative 'double_dog/use_cases/success_failure.rb'
require_relative 'double_dog/entities/item.rb'
require_relative 'double_dog/entities/user.rb'
require_relative 'double_dog/entities/order.rb'

require_relative 'double_dog/database/database.rb'
require_relative 'double_dog/database/in_memory.rb'

require_relative 'double_dog/use_cases/create_account.rb'
require_relative 'double_dog/use_cases/create_item.rb'
require_relative 'double_dog/use_cases/sign_in.rb'
require_relative 'double_dog/use_cases/see_all_orders.rb'
require_relative 'double_dog/use_cases/create_order.rb'

