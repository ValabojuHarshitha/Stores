module HomeHelper

  def store_item_list_with_radius(items,loc_id)
    final_stores_list=[]
    final_items_list=[]
    @items=items
    @location_id=loc_id
    @items.each do |i|
        store=Store.find(StoreCategory.find(i.store_category_id).store_id)
        location=Location.find(store.location_id)
        if location.id==@location_id.to_i
            @reqlocitem=i.id
            @reqlocstore=store.id
         end
        unless @destlist.blank?
             if @destlist.include?(location.id)
                final_stores_list <<  store.id
                final_items_list << i.id
             end
        else
           if @location_id==location.id
              final_stores_list << store.id
              final_items_list << i.id
           end
       end
    end

        unless @reqlocitem.blank?
          final_stores_list.insert(0,Store.find(@reqlocstore).id)
          final_items_list.insert(0,Item.find(@reqlocitem).id)
        end
      arr=(0..final_items_list.count.to_i-1)

    return final_stores_list,final_stores_list,arr
  end

end
