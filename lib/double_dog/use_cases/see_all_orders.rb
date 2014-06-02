module DoubleDog
  class SeeAllOrders
    def run(params)
      ## Refactor repated failure and succes definitions !!
      return failure(:not_admin) unless admin_session?(params[:admin_session])

      orders = DoubleDog.db.all_orders
      return success(orders: orders)
    end

    def admin_session?(session_id)
      user = DoubleDog.db.get_user_by_session_id(session_id)
      user && user.admin?
    end

  private

    def failure(error_name)
      # Refactor :success?
      return :success? => false, :error => error_name
    end

    def success(data)
      # Refactor :success?
      return data.merge(:success? => true)
    end
  end
end
