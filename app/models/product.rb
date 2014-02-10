class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  default_scope :order => :title
	
	validates :title , :description, :image_url , :price ,  :presence => true 
	validates :price , :numericality => {:greater_than_or_equal_to => 0.01 }
	validates :title , :uniqueness => true
	validates :image_url , :format => {

				:with    => %r{\.(png|jpg|gif)$}i ,
				:message => 'Must be a URL for JPG ,PNG or GIF image'
			}
end
