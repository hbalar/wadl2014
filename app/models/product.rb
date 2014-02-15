class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  has_many :line_items

  default_scope :order => :title
	
	validates :title , :description, :image_url , :price ,  :presence => true 
	validates :price , :numericality => {:greater_than_or_equal_to => 0.01 }
	validates :title , :uniqueness => true
	validates :image_url , :format => {

				:with    => %r{\.(png|jpg|gif)$}i ,
				:message => 'Must be a URL for JPG ,PNG or GIF image'
			}


  before_destroy  :ensure_not_referenced_by_any_line_item


  private

  def ensure_not_referenced_by_any_line_item 


  	if line_items.empty?
  		return true
  	else
  		errors.add(:base,'Line Items presents')
  		return false
  	end 

  end

end
