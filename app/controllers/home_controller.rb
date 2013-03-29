class HomeController < ApplicationController
   layout 'home'

  def index
    @locations=Location.where('city_id',3493)
    @radius=(1..20)
#-------------------------------
@json=Store.all.to_gmaps4rails
#--------------------------------
   
  end

  def show_stores
    @location_id=params[:location_id]

  name=params[:item_name]
  locationid=params[:location_id]
  radius=params[:radius_id]
   @sets=Locationdistance.connection.select_all "select ids.location_id,ids.destination_id,ids.radius,s.id,s.store_name,i.item_name,i.price,i.id as item_id from
locationdistances ids join stores s on ids.destination_id=s.location_id
join store_categories cs on s.id=cs.store_id
join items i on i.store_category_id =cs.id
where ids.location_id=#{locationid} AND ids.radius <=#{radius} AND i.item_name like '%#{name}%'"
@storeids=[]
@sets.map{|i| @storeids << i['id']}
    @category=CategoryType.all

#      @store_id=params[:store_id]
#     unless params[:store_id].blank?
       @json=Store.find(@storeids)
#     else
#       @json=Store.all
#     end

#    stores=Store.search do
#    fulltext params[:item_name]
#    with(:location_id,params[:location_id])
#    end
#    @stores=stores.results
#
#    itemlist=Item.search do
#      fulltext params[:item_name]
#     # paginate(:page => params[:page], :per_page => 10)
#    end
#    @items=itemlist.results
#
#    @destlist=[]
#    locdist=Locationdistance.search do
#      with(:location_id,params[:location_id])
#      with(:radius,(1.0..params[:radius_id].to_f)) unless params[:radius_id].blank?
#     end
#    loc_distances=locdist.results
#    loc_distances.uniq{|x| @destlist << x.destination_id}
#
#    unless @items.blank?
#     @final_items_list,@final_stores_list,@arr_count = store_item_list_with_radius(@items,@location_id,@destlist)
#    end
#    logger.info"-------#{@final_items_list}--------"
   
  end

def save_stores
  params[:send_item][:item_ids].each do |c|
  logger.info "-----getme--#{c}-----"
  end
  
  render :js=>"alert('hi');" 
end

def select_items
end

def googlemaps
   @json=Store.find(params[:store_id])

end
  def city
    state_id=params[:state_id]
    @cities=City.where(:state_id=>state_id)
  end

end
