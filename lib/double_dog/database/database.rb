require 'active_record'
# require 'sqlite3'
require 'pry'

module DoubleDog
  module Database
    class SQLiteDatabase

      def clear_all
        User.destroy_all
        Item.destroy_all
        Order.destroy_all
      end

      def initialize
        ActiveRecord::Base.establish_connection(
          :adapter => 'sqlite3',
          :database => 'double-dog_test'
          )
      end

      class User < ActiveRecord::Base
        has_many :orders
        has_many :items, through: :orders
      end

      class Order < ActiveRecord::Base
        belongs_to :user
        has_many :items
      end

      class Item < ActiveRecord::Base
        belongs_to :order
      end

      def create_user(attrs)
        ar_user = User.create(attrs)
        DoubleDog::User.new(ar_user.id, ar_user.username, ar_user.password, ar_user.admin)
      end

      def get_user(id)
        User.find(id)
      end

      def create_item(attrs)
        ar_item = Item.create(attrs)
        DoubleDog::Item.new(ar_item.id, ar_item.name, ar_item.price)
      end

      def all_items
        Item.all
      end

      def get_item(id)
        Item.find(id)
      end

      def create_order(attr)
        ar_order = Order.create(attrs)
        DoubleDog::Order.new(ar_order.id, ar_order.employee_id, ar_order.item_id)
      end
    end
  end
end

