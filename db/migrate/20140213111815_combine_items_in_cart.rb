class CombineItemsInCart < ActiveRecord::Migration
  def up

	   Cart.all.each do |cart|

	   		sums = cart.line_items.group(:product_id).sum(:quantiy)

	   		sums.each do |product_id ,quantiy|
		   					if quantiy >1
		   						#remove individual items
		   						cart.line_items.where(:product_id => product_id).delete_all

		   						#replace with single items

		   						cart.line_items.create(:product_id => product_id, :quantiy => quantiy)
		   					end 
	           	      end
	   	end
	end



  def down
	  	# split items with quantiy>1 into multiple items
		LineItem.where("quantiy>1").each do |line_item|
		# add individual items
		line_item.quantiy.times do
		LineItem.create :cart_id=>line_item.cart_id,
		:product_id=>line_item.product_id, :quantiy=> 1
		end

		#remove original item

		line_item.destroy
 		 end
	end

end
