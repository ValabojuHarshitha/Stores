class CustomerController < ApplicationController
  layout 'customer_dashboard'

  def index
    @radius=Locationdistance.select(:radius).order('radius ASC').uniq

    if request.post?
      @search=Location.search do
        fulltext "#{params[:location_name]}"
      end
      @location_list=@search.results
      logger.info "--------------#{@location_list}"
    end
  end

  def store_listing
    @radius=Locationdistance.select(:radius).order('radius ASC').uniq

    @search=Locationdistance.search do
      fulltext params[:location_name]
      with(:radius,(1.0..params[:radius].to_f)) unless params[:radius].blank?
    end
    location_list=@search.results
    mainlist=[]
    destlist=[]
    location_list.uniq{|x| mainlist << x.location_id}
    location_list.uniq{|x| destlist << x.destination_id}
    @listelements=(mainlist.uniq+destlist.uniq).uniq

  end

  def listing_items
    @store=Store.find(params[:store_id])
    #@storeitems=Storeitem.where("store_id",@store.id).page(params[:page]).per(10)
    @search=Storeitem.search do
      with(:store_id,params[:store_id])
      paginate(:page => params[:page], :per_page => 12)
    end
    @storeitems=@search.results
    #-----------------

    #    items=Item.all
    #    items.each do |i|
    #      vend=Category.find(i.category_id).vendor_id
    #      stores=Store.where("vendor_id = ?",vend)
    #      logger.info"-----icame1---------"
    #      stores.each do |s|
    #        logger.info"-----icame2---------"
    #        Storeitem.create(:store_id=>s.id,:item_id=>i.id,:quantity=>10)
    #        logger.info"-----icame3---------"
    #      end
    #    end
    #-----------------
  end
  def listing

  end
  def user_store_list
    @store_value=params[:store_id]
    @user_id=current_user.id
    #CustomerStore.where("store_id and customer_id",@store_value)
    if @store_value
      @check_store_list=CustomerStore.find_by_sql("select id  from customer_stores where store_id=#{@store_value} and customer_id=#{@user_id}")
      if @check_store_list.blank?
        @user_store_save= CustomerStore.new(:store_id=>@store_value,:customer_id=>current_user.id)
        if @user_store_save.save
          #render :js=> '$("#message").html("Added to Store list");'
          #render :js=>"$('#cart').append(#{@test});"
          @message="Added to Store list"
        end
      else
        @message="Already Store has been added to Store List"
        #render :js=> '$("#message").html("Already Store has been added to Store List");'
      end
    end
  end
  def store_category_list
    @store_id=params[:store_id]

    if   @store_id
      #@store_category_type=StoreCategory.find_by_sql("select distinct category_type_id from store_categories where store_id=#{@store_id}")
      @store_category_type=StoreCategory.connection.select_all"SELECT DISTINCT sc.category_type_id, sc.store_id,ct.name
        FROM store_categories sc
        JOIN category_types ct ON sc.category_type_id = ct.id WHERE sc.store_id =#{@store_id}"
      #logger.info"#{ params[:item_arry]}"
      @a=params[:item_arry]
    end
  end
  def item_list
    if params[:store_id] and params[:store_cat_id]
      @store_item=Item.where("store_category_id=#{params[:store_cat_id]}").select("id,price,item_name")
    end
  end
  #@@cc=Array.new
  def right_item_list
      #@cc=Array.new
    #logger.info"#{ params[:item_arry]}"

       @a=params[:item_arry].split(",")
  end
    def fav_list

      logger.info"hjjjjjjjjjjjjjjjjjfgsdf#{params[:item_ids].class}"

        @search=params[:item_ids]
=begin
if params[:item_id]
        @search=params[:selected_arry].split(",")

       #@search.delete(params[:item_id])
      else
        @search=params[:selected_arry].split(",")
      end

=end
      if params[:add_list].to_i==1
        logger.info"enter fave listtttttttttttttttttttttttttttt"
        Item.item_details(@search,"#{params[:list_name]}",current_user.id)
      end
    end
  def quantity
=begin
@quan=params[:quantity].to_i
    @pro_price=params[:price].to_i
    @total=@quan * @pro_price

    logger.info"------------#{@quan}--#{@pro_price}------"
    flash[:notice] = "Product was successfully created."
    render :js=>"$('#quantitys#{params[:item_id]}').html(#{@total});"
=end
    @remove_item_id=params[:item_id]
    logger.info"------------#{@remove_item_id.class}--#{params[:all_items]}------"
    @list=params[:all_items]
    @list.delete(@remove_item_id)
    logger.info"classsssssssssssss#{@list}"

  end
  def buy
    if params[:pay_at_store]
      logger.info"sdsdsdsdsdd#{params[:quantity267]}"
      logger.info"twooooooooooo   Pay at Store"
    elsif params[:pay_online]
      logger.info"sdsdsdsdsdd#{params[:quantity267]}"
      logger.info"twooooooooooo   Pay Online"
    end

  end
  def my_list
   @my_list=CustomerItem.where("customer_list_id = ?",params[:cust_list_id])
  end
  def test_haml
       logger.info"sdsdsdsdsdd#{params[:accept2]}"

  end
    def removed_list

    end
end
