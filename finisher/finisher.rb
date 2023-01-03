while true
  products = find_outputs("products", {"processed": "0"}, 1, 500)
  
  break if products.empty?
  
  products.each do |prod|
    # find barcode
    barcode = find_outputs("barcode", {"_id": prod['competitor_product_id']}, 1,1)
    prod['barcode'] = barcode['barcode']
    prod['item_identifiers'] = barcode['item_identifiers']

    rating = find_outputs("rating", {"_id": prod['competitor_product_id']}, 1,1)
    prod['reviews'] = rating['reviews']

    prod['processed'] = '1'
    outputs << prod
    save_outputs outputs if outputs.count > 99
  end

end