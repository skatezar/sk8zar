class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only:
  [:home, :show, :about, :contact, :community, :tapes, :skatedice,
    :ambassador, :ledgedice, :ledgediceeasy, :ledgedicemedium, :ledgedicehard, :skatediceeasy, :skatedicemedium,
    :skatedicehard, :free, :sendit, :blog, :blog1, :blog2, :ledgepasscodex, :showTeam, :skatezarteam, :coinproducts]

  def home
    if params[:query].present?
      @pagy, @items = pagy policy_scope(Item).search_by_filters(params[:query]).where(sold: false)

    elsif params[:search].present?
      brands = params[:search][:brands]
      categories = params[:search][:categories] #.reject(&:empty?)
      sizes = params[:search][:sizes]
      conditions = params[:search][:conditions]
      location = params[:search][:location]
      radius = params[:search][:radius]
      pricemin = params[:search][:pricemin]
      pricemax = params[:search][:pricemax]


      #only price
      if brands == nil && categories == nil && sizes == nil && conditions == nil && location == ""
        @pagy, @items = pagy Item.all.where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)
      #only location
      elsif brands == nil && categories == nil && sizes == nil && conditions == nil && location
        @pagy, @items = pagy Item.near(location, radius, units: :km).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #only brands
      elsif brands && categories == nil && sizes == nil && conditions == nil && location == ""
        @pagy, @items = pagy single_filter(brands).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)
      #brands and location
      elsif brands && categories == nil && sizes == nil && conditions == nil && location.present?
        @pagy, @items = pagy single_filter(brands).near(location, radius, units: :km).where(sold: :false)

      #only categories
      elsif categories && brands == nil && sizes == nil && conditions == nil && location == ""
        @pagy, @items = pagy single_filter(categories).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      # categories and location
      elsif categories && brands == nil && sizes == nil && conditions == nil && location.present?
        @pagy, @items = pagy single_filter(categories).near(location, radius, units: :km).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #only sizes
      elsif sizes && categories == nil && brands == nil && conditions == nil && location == ""
        @pagy, @items = pagy single_filter(sizes).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      # sizes and location
      elsif sizes && categories == nil && brands == nil && conditions == nil && location.present?
        @pagy, @items = pagy single_filter(sizes).near(location, radius, units: :km).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #only condition
      elsif conditions && categories == nil && brands == nil && sizes == nil && location == ""
        @pagy, @items = pagy single_filter(conditions).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #condition and location
      elsif conditions && categories == nil && brands == nil && sizes == nil && location.present?
        @pagy, @items = pagy single_filter(conditions).near(location, radius, units: :km).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #brands and categories
      elsif brands && categories && conditions == nil && sizes == nil && location == ""
        @pagy, @items = pagy double_filter(brands, categories).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #brands and categories and location
      elsif brands && categories && conditions == nil && sizes == nil && location.present?
        @pagy, @items = pagy double_filter(brands, categories).near(location, radius, units: :km).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #brands and sizes
      elsif brands && sizes && conditions == nil && categories == nil && location == ""
        @pagy, @items = pagy double_filter(brands, sizes).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #brands and sizes and location
      elsif brands && sizes && conditions == nil && categories == nil && location.present?
        @pagy, @items = pagy double_filter(brands, sizes).near(location, radius, units: :km).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #brands and conditions
      elsif brands && conditions && sizes == nil && categories == nil && location == ""
        @pagy, @items = pagy double_filter(brands, conditions).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #brands and conditions and location
      elsif brands && conditions && sizes == nil && categories == nil && location.present?
        @pagy, @items = pagy double_filter(brands, conditions).near(location, radius, units: :km).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #categories and sizes
      elsif categories && sizes && conditions == nil && brands == nil && location == ""
        @pagy, @items = pagy double_filter(categories, sizes).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #categories and sizes and location
      elsif categories && sizes && conditions == nil && brands == nil && location.present?
        @pagy, @items = pagy double_filter(categories, sizes).near(location, radius, units: :km).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #categories and conditions
      elsif categories && conditions && sizes == nil && brands == nil && location == ""
        @pagy, @items = pagy double_filter(categories, conditions).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #categories and conditions and location
      elsif categories && conditions && sizes == nil && brands == nil && location.present?
        @pagy, @items = pagy double_filter(categories, conditions).near(location, radius, units: :km).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #sizes and conditions
      elsif sizes && conditions && categories == nil && brands == nil && location == ""
        @pagy, @items = pagy double_filter(sizes, conditions).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #sizes and conditions and location
      elsif sizes && conditions && categories == nil && brands == nil && location.present?
        @pagy, @items = pagy double_filter(sizes, conditions).near(location, radius, units: :km).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #brands and categories and sizes
      elsif brands && categories && sizes && conditions == nil && location == ""
        @pagy, @items = pagy tripple_filter(brands, categories, sizes).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #brands and categories and sizes and location
      elsif brands && categories && sizes && conditions == nil && location.present?
        @pagy, @items = pagy tripple_filter(brands, categories, sizes).near(location, radius, units: :km).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #brands and categories and conditions and location
      elsif brands && categories && conditions && sizes == nil && location == ""
        @pagy, @items = pagy tripple_filter(brands, categories, conditions).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #brands and categories and conditions
      elsif brands && categories && conditions && sizes == nil && location.present?
        @pagy, @items = pagy tripple_filter(brands, categories, conditions).near(location, radius, units: :km).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #brands and sizes and conditions
      elsif brands && sizes && conditions && categories == nil && location == ""
        @pagy, @items = pagy tripple_filter(brands, sizes, conditions).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #brands and sizes and conditions and location
      elsif brands && sizes && conditions && categories == nil && location.present?
        @pagy, @items = pagy tripple_filter(brands, sizes, conditions).near(location, radius, units: :km).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #categories and sizes and conditions
      elsif categories && sizes && conditions && brands == nil && location == ""
        @pagy, @items = pagy tripple_filter(categories, sizes, conditions).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #categories and sizes and conditions and location
      elsif categories && sizes && conditions && brands == nil && location.present?
        @pagy, @items = pagy tripple_filter(categories, sizes, conditions).near(location, radius, units: :km).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #categories and sizes and conditions and brands
      elsif categories && sizes && conditions && brands && location == ""
        @pagy, @items = pagy quad_filter(categories, sizes, conditions, brands).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      #categories and sizes and conditions and brands and location
      elsif categories && sizes && conditions && brands && location.present?
        @pagy, @items = pagy quad_filter(categories, sizes, conditions, brands).near(location, radius, units: :km).where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)

      else
        @pagy, @items = pagy Item.all.where("price >= ?", pricemin).where("price <= ?", pricemax).where(sold: :false)
      end



      # @items = Item.tagged_with(params[:search][:categories], :any => true )
      # @items = Item.tagged_with([params[:search][:categories], params[:search][:brands]], :match_all => true )
    else
       @pagy, @items = pagy(policy_scope(Item).order(created_at: :desc).where(sold: :false))
    end
  end
  def single_filter(filter)
    if filter.count > 1
      @items = Item.tagged_with([filter], :any => true)
    else
      @items = Item.tagged_with(filter)
    end
  end

  def double_filter(first_filter, second_filter)
   if first_filter.count == 1 && second_filter.count == 1
      @items = Item.tagged_with(first_filter).tagged_with(second_filter)
    elsif first_filter.count > 1 && second_filter.count == 1
      @items = Item.tagged_with([first_filter], :any => true).tagged_with(second_filter)
    elsif first_filter.count == 1 && second_filter.count > 1
      @items = Item.tagged_with(first_filter).tagged_with([second_filter], :any => true)
    else
      @items = Item.tagged_with([first_filter], :any => true).tagged_with([second_filter], :any => true)
    end
  end

  def tripple_filter(first_filter, second_filter, third_filter)
    if first_filter.count == 1 && second_filter.count == 1 && third_filter.count == 1
      @items = Item.tagged_with(first_filter).tagged_with(second_filter).tagged_with(third_filter)
    elsif first_filter.count > 1 && second_filter.count == 1 && third_filter.count == 1
      @items = Item.tagged_with([first_filter], :any => true).tagged_with(second_filter).tagged_with(third_filter)

    elsif first_filter.count == 1 && second_filter.count > 1 && third_filter.count == 1
      @items = Item.tagged_with(first_filter).tagged_with([second_filter], :any => true).tagged_with(third_filter)

    elsif first_filter.count == 1 && second_filter.count == 1 && third_filter.count > 1
      @items = Item.tagged_with(first_filter).tagged_with(second_filter).tagged_with([third_filter], :any => true)

    elsif first_filter.count > 1 && second_filter.count > 1 && third_filter.count == 1
      @items = Item.tagged_with([first_filter], :any => true).tagged_with([second_filter], :any => true).tagged_with(third_filter)

    elsif first_filter.count == 1 && second_filter.count > 1 && third_filter.count > 1
      @items = Item.tagged_with(first_filter).tagged_with([second_filter], :any => true).tagged_with([third_filter], :any => true)

    elsif first_filter.count > 1 && second_filter.count == 1 && third_filter.count > 1
      @items = Item.tagged_with([first_filter], :any => true).tagged_with(second_filter).tagged_with([third_filter], :any => true)

    elsif first_filter.count > 1 && second_filter.count > 1 && third_filter.count > 1
      @items = Item.tagged_with([first_filter], :any => true).tagged_with([second_filter], :any => true).tagged_with([third_filter], :any => true)
    else
      @items = Item.all
    end
  end

  def quad_filter(first_filter, second_filter, third_filter, quad_filter)
    if first_filter.count == 1 && second_filter.count == 1 && third_filter.count == 1 && quad_filter.count == 1
      @items = Item.tagged_with(first_filter).tagged_with(second_filter).tagged_with(third_filter).tagged_with(quad_filter)

    elsif first_filter.count > 1 && second_filter.count > 1 && third_filter.count > 1 && quad_filter.count > 1
      @items = Item.tagged_with([first_filter], :any => true).tagged_with([second_filter], :any => true).tagged_with([third_filter], :any => true).tagged_with([quad_filter], :any => true)

    elsif first_filter.count > 1 && second_filter.count > 1 && third_filter.count == 1 && quad_filter.count == 1
      @items = Item.tagged_with([first_filter], :any => true).tagged_with([second_filter], :any => true).tagged_with(third_filter).tagged_with(quad_filter)

    elsif first_filter.count == 1 && second_filter.count == 1 && third_filter.count > 1 && quad_filter.count > 1
      @items = Item.tagged_with(first_filter).tagged_with(second_filter).tagged_with([third_filter], :any => true).tagged_with([quad_filter, :any => true])

    elsif first_filter.count > 1 && second_filter.count == 1 && third_filter.count > 1 && quad_filter.count == 1
      @items = Item.tagged_with([first_filter], :any => true).tagged_with(second_filter).tagged_with([third_filter], :any => true).tagged_with(quad_filter)

    elsif first_filter.count == 1 && second_filter.count > 1 && third_filter.count == 1 && quad_filter.count > 1
      @items = Item.tagged_with(first_filter).tagged_with([second_filter], :any => true).tagged_with(third_filter).tagged_with([quad_filter], :any => true)

    elsif first_filter.count > 1 && second_filter.count == 1 && third_filter.count == 1 && quad_filter.count > 1
      @items = Item.tagged_with([first_filter], :any => true).tagged_with(second_filter).tagged_with(third_filter).tagged_with([quad_filter], :any => true)

    elsif first_filter.count == 1 && second_filter.count > 1 && third_filter.count > 1 && quad_filter.count == 1
      @items = Item.tagged_with(first_filter).tagged_with([second_filter], :any => true).tagged_with([third_filter], :any => true).tagged_with(quad_filter)

    elsif first_filter.count > 1 && second_filter.count == 1 && third_filter.count == 1 && quad_filter.count == 1
      @items = Item.tagged_with([first_filter], :any => true).tagged_with(second_filter).tagged_with(third_filter).tagged_with(quad_filter)

    elsif first_filter.count == 1 && second_filter.count > 1 && third_filter.count == 1 && quad_filter.count == 1
      @items = Item.tagged_with(first_filter).tagged_with([second_filter], :any => true).tagged_with(third_filter).tagged_with(quad_filter)

    elsif first_filter.count == 1 && second_filter.count == 1 && third_filter.count > 1 && quad_filter.count == 1
      @items = Item.tagged_with(first_filter).tagged_with(second_filter).tagged_with([third_filter], :any => true).tagged_with(quad_filter)

    elsif first_filter.count == 1 && second_filter.count == 1 && third_filter.count == 1 && quad_filter.count > 1
      @items = Item.tagged_with(first_filter).tagged_with(second_filter).tagged_with(third_filter).tagged_with([quad_filter], :any => true)

    elsif first_filter.count == 1 && second_filter.count > 1 && third_filter.count > 1 && quad_filter.count > 1
      @items = Item.tagged_with(first_filter).tagged_with([second_filter], :any => true).tagged_with([third_filter], :any => true).tagged_with([quad_filter], :any => true)

    elsif first_filter.count > 1 && second_filter.count == 1 && third_filter.count > 1 && quad_filter.count > 1
      @items = Item.tagged_with([first_filter], :any => true).tagged_with(second_filter).tagged_with([third_filter], :any => true).tagged_with([quad_filter], :any => true)

    elsif first_filter.count > 1 && second_filter.count > 1 && third_filter.count == 1 && quad_filter.count > 1
      @items = Item.tagged_with([first_filter], :any => true).tagged_with([second_filter], :any => true).tagged_with(third_filter).tagged_with([quad_filter], :any => true)

    elsif first_filter.count > 1 && second_filter.count > 1 && third_filter.count > 1 && quad_filter.count == 1
      @items = Item.tagged_with([first_filter], :any => true).tagged_with([second_filter], :any => true).tagged_with([third_filter], :any => true).tagged_with(quad_filter)
    else
      @items = Item.all
    end
  end

  def size_based_on_category(category)
    if params[:search][:categories] == ["#{category}"]
        $sizes = Item.where(category: "#{category}").distinct.pluck(:size)
    end
  end

  def tricktips
  end

  def about
  end

  def contact
  end

  def community
  end

  def tapes
  end

  def skatedice
  end

  def ambassador
  end

  def ledgedice
  end

  def ledgediceeasy
  end

  def ledgedicemedium
  end

  def ledgedicehard
  end

  def skatediceeasy
  end

  def skatedicemedium
  end

  def skatedicehard
  end

  def sendit
  end

  def ledgepasscode
  end

  #blogs
  def blog
  end

  def blog1
  end

  def blog2
    @skatespots = Skatespot.near("Vienna, Austria")
  end

  def claimsubmitted
  end

  def tasksubmitted
  end

  def promoteitem
  end

  def promoteitemsuccessfully
    @item = Item.find(params[:item_id])
    @item.update(created_at: Time.now)
    @user = current_user
    @user.update(coins_expensed: @user.coins_expensed + 2)
  end

  def skatezarteam
    @users = User.all
  end

  def showTeam
    @user = User.find(params[:id])
    @items = Item.where(user: @user)
  end

  def ordersubmitted
  end

  def allorderspending
    @allorders = Skatezarcoinorder.where(completed: false)
  end

  def allorderscompleted
    @allorders = Skatezarcoinorder.where(completed: true)
  end

  def coinproducts
    @user = User.find_by(email: "skatezar@gmail.com")
    @coinproducts = Item.where(user: @user)
  end

  def allclaimspending
    @claims = Claim.where(completed: false)
  end

  def allclaimscompleted
    @claims = Claim.where(completed: true)
  end

  def coinsawarded
    @task = Communitytask.find(params[:communitytask_id])
    @claim = Claim.find(params[:claim_id])
    @user = User.find(@claim.user_id)
    @claim.update(completed: true)
    @user.update(coins_earned: @user.coins_earned + @task.coin_reward)
    redirect_to allclaimscompleted_path
  end

  def ordercompleted
    @order = Skatezarcoinorder.find(params[:order_id])
    @order.update(completed: true)
    redirect_to allorderscompleted_path
  end

  def websitepolicy
  end

  def allmessages
    @messages = Message.all
  end

  def itemsold
    @item = Item.find(params[:item_id])
    @item.update(sold: true)
    redirect_to user_my_items_path(current_user)
  end

  def itemavailable
    @item = Item.find(params[:item_id])
    @item.update(sold: false)
    redirect_to user_my_items_path(current_user)
  end

  def solditems
    @items = Item.where(sold: true)
  end

  def shoeswapone
  end
end
