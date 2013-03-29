load  'post.rb'
class UserController < ApplicationController
  include Post
  include Common
  def index
   @a=Post::Comment.add(1,2)
    logger.info"#{@a}"
    @b=Common.display
  end

  def multi_level
    @search_query="oil"
    @sunspot_search = Sunspot.search Locationdistance,StoreCategory,Item do |query|
      query.keywords "oil"
      query.with(:location_id).equal_to 6
      query.with(:radius).less_than 5
      #query.fulltext "oil"

      #query.paginate(:page => params[:page], :per_page => 30)
    end

  end
end
