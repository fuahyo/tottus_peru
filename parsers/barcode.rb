json = JSON.parse(content)

vars = page['vars']
barcode = json['Results'],first['EANs'].first rescue nil

item_identifiers = nil
if barcode
    item_identifiers = {
        barcode: "'#{barcode}'"
    }.to_json
end

outputs << {
    _collection: "barcode",
    _id: vars['productId']
    barcode: barcode,
    item_identifiers: item_identifiers
}