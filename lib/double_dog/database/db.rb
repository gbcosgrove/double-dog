module DoubleDog
  module Database
    class SQLiteDatabase

      def initialize
      ActiveRecord::Base.establish_connection(
        :adapter => 'sqlite3',
        :database => 'DoubleDog.db'
      )
      end

      class User < ActiveRecord::Base
        has_many :orders
      end

      class Order < ActiveRecord::Base
        belongs_to :user
      end

      class Item < ActiveRecord::Base
        belongs_to :order
      end

      def create_user(attrs)
      end

      def get_user(id)
      end

      def create_session(attrs)
      end

      def get_user_by_session_id(sid)
      end

      def get_user_by_username(username)
      end

      def get_item(id)
      end

      def all_items
      end

      def create_order(attrs)

      end

      def get_order(id)
      end

      def all_orders
      end
    end
  end
end
