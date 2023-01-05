while true
  products = find_outputs("products", {"processed": "0"}, 1, 500)
  
  break if products.empty?
  
  products.each do |prod|
    # find barcode
    barcode = find_outputs("barcode", {"_id": prod['competitor_product_id']}, 1,1)
    unless barcode.empty?
      barcode = barcode.first
      prod['barcode'] = barcode['barcode']
      prod['item_identifiers'] = barcode['item_identifiers']
    end

    rating = find_outputs("rating", {"_id": prod['competitor_product_id']}, 1,1)
    unless rating.empty?
      rating = rating.first
      prod['reviews'] = rating['reviews']
    end

    prod['processed'] = '1'
    outputs << prod
    save_outputs outputs if outputs.count > 99
  end

end