require 'active_record'
require 'pry'

module DoubleDog
  module Database
    class SQLiteDatabase

      def clear_all
        User.delete_all
        Item.delete_all
        Order.delete_all
        Session.delete_all
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

      class Session < ActiveRecord::Base
        belongs_to :user
      end

      def build_user(attrs)
        DoubleDog::User.new(attrs[:id], attrs[:username], attrs[:password], attrs[:admin])
      end

      def create_user(attrs)
        ar_user = User.create(attrs)
        build_user(ar_user)
      end

      def get_user(id)
        user = User.find_by(id: id)
        build_user(user)
      end

      def build_session(attrs)
        DoubleDog::Session.new(attrs[:id], attrs[:user_id])
      end

      def create_session(attrs)
        id = attrs[:user_id]
        ar_session = Session.create({:user_id => id})
        build_session(ar_session)
      end

      def get_user_by_session_id(sid)
        # Find the session by session-id - set to a variable
        # Get the user_id of the session - set to a variable
        # Find the user using the user_id from session
        # build a user by passing in the previous variable into
        ar_session = Session.find_by(id: sid)
        session = build_session(ar_session)
        id = session.user_id
        ar_user = User.find_by(id: id)
        build_user(ar_user)
      end

      def get_user_by_username(username)
        ar_user = User.find_by(username: username)
        build_user(ar_user)
      end

      def build_item(attrs)
        DoubleDog::Item.new(attrs[:id], attrs[:name], attrs[:price])
      end

      def create_item(attrs)
        ar_item = Item.create(attrs)
        build_item(ar_item)
      end

      def all_items
        ar_item = Item.all
        ar_item.map do |item|
          build_item(item)
        end
      end

      def get_item(id)
        ar_item = Item.find_by(id: id)
        build_item(ar_item)
      end

      def build_order(attrs)
        DoubleDog::Order.new(attrs[:id], attrs[:employee_id], attrs[:items])
      end

      def create_order(attr)
        ar_order = Order.create(:employee_id => attr[:employee_id])
        build_order = {:id => ar_order.id, :employee_id => ar_order.employee_id, :items => attr[:items]}
        build_order(build_order)
      end


      def get_order(id)
        ar_order = Order.find_by(id: id)
        ar_order_items = ar_order.items
        order = {:id => ar_order.id, :employee_id => ar_order.employee_id, :items => ar_order_items}
        build_order(order)
      end

      def all_orders
        ar_order = Orders.all
        build_order(ar_order)
      end
    end
  end
end

