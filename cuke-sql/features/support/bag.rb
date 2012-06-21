
class Bag
  #Mandatory Attributes of each product added to card
  @productname
  @webid
  @color #optional parameter 
  @size #optional parameter
  @price
  @qty
  #Counter per instance to count number of products get added to shopping bag
  @productCount
  
  # Product uniqure attributes needs to move to database
  @xpath_product_dricption = "//div[@id='productDescription']/*/h1[@id='productTitle']"
  @xpath_product_webid = "//div[@id='productDescription']/*/div[@class='productID']"
  @xpath_product_price = "//div[@id='productDescription']/div[@id='priceInfo']/*/span" 
  @xpath_product_color = "//div[@id='productDescription']/div[@id='productBox']/div[2]/h3/span"
  @xpath_product_size = "//div[@id='productBox']/div[2]/div[2]/div[1]/*/li[@class='horizontal size selected']"
  @xpath_product_quantity = "" 
 
  def initialize()
    @hashes=[]
    @productCount=0
  end
  
  #set the current product dec/name
  def setproductname (strPname)
    @productname = strPname
  end
  
  #set the current product web id
  def setwebid (strWebid)
    @webid = strWebid
  end
  
  #set the current product color
  def setcolor(strColour)
    @color = strColour
  end
  
  #set the current product size
  def setsize(strSize)
    @size=strSize
  end
  
  #set the current product price
  def setprice(intprice)
    @price =intprice
  end
  
  #set the current project quantity
  def setquantity(intQty)
    @qty=intQty
  end
  
  #Adding the product to hash with all required information of the product
  def addProductToCart(productname,webid,colour,size,price,qty)
    @productCount=@productCount+1
    @hashes[@productCount] = {"pname"=>productname,"webid"=>webid,"color"=>colour,"size"=>size,"price"=>price,"qty"=>qty}
  end
  
  #get the webid of the N'th product which is available in the cart
  def getProductWebIdByOrderOfProduct(intOrderOfProduct)
    return @hashes[intOrderOfProduct]["webid"]
  end
  
  #get the product name/dec of the N'th product which is available in the cart
  def getProductNameByOrderOfProduct(intOrderOfProduct)
    return @hashes[intOrderOfProduct]["pname"]
  end
  
  #get the price of the N'th product which is available in the cart
  def getProductPriceByOrderOfProduct(intOrderOfProduct)
    return @hashes[intOrderOfProduct]["price"]
  end
  
  #get the product name/dec of the last product which is available in the cart
  def getLastProductName()
    return @hashes[@productCount]["pname"]
  end
  
  #get the product name/dec of the first product which is available in the cart
  def getFirstProductName()
    return @hashes[1]["pname"]
  end
  
  #get the product price of the first product which is available in the cart
  def getFirstProductPrice()
    return @hashes[1]["price"]
  end
  
  #get the product price of the last product which is available in the cart
  def getLastProductPrice()
    return @hashes[@productCount]["price"]
  end
  
  #return the total price for all products added to the shopping bag
  def getTotalPriceforAllProducts()
    @total=0 
    for i in 1..@productCount
      @total=@total + @hashes[i]["price"]
    end
    return @total
  end
  
  #return the total iteam of all products added the shopping bag
  def getTotalIteamCountForAllProducts()
    @proCount=0
    for i in 1..@productCount
      @proCount=@proCount + @hashes[i]["qty"]
    end
    return @proCount
  end
  

end

################################Example : Accessing this class ########################
#$obj =Bag.new
#$obj.addProductToCart("SaraTest1","S1","Black","23*45",1.00,9)
#$obj.addProductToCart("SaraTest2","S2","White","43*67",4.78,1)
#puts $obj.getTotalPriceforAllProducts()
#puts $obj.getTotalIteamCountForAllProducts()
#######################################################################################

