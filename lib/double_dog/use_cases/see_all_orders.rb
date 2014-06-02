module DoubleDog
  class SeeAllOrders <SuccessFailure
    include AdminSession


    def run(params)
      ## Refactor repated failure and succes definitions !!
      return failure(:not_admin) unless admin_session?(params[:admin_session])

      orders = DoubleDog.db.all_orders
      return success(orders: orders)
    end

  end
end
