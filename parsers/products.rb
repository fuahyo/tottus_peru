html = Nokogiri.HTML(content)

var = page['vars']
no_exists = html.css('h3.error-title')


if no_exists.empty?
    competitor_product_id = page['url'].split('/')[-2].split('-').last
    name = html.at_css('h1.title').text.strip
    brand_selector = html.at_css('div.subtitle-container')
    brand = brand_selector ? brand_selector.text.split(' - ').first : nil
   
    customer_price_lc = html.at_css('span.cmrPrice').text.scan(/\d+[,.]*\d*[,.]*\d*/).first.gsub(',', '').to_f
    if html.at_css('.column-right-content .ProductPrice .regularPrice')
        base_price = html.at_css('.column-right-content .ProductPrice .regularPrice').text.empty? ? customer_price_lc : html.at_css('.column-right-content .ProductPrice .regularPrice').text.scan(/\d+[,.]*\d*[,.]*\d*/).first.gsub(',', '').to_f 
    else
        base_price = customer_price_lc
    end

    has_discount = false
    discount_percentage = nil

    if customer_price_lc < base_price
        has_discount = true
        discount_percentage = (((base_price - customer_price_lc) / base_price) * 100).round(7)
    end

    size_regex = [
        /(\d*[\.,]?\d+)\s?(litre)/i,
        /(\d*[\.,]?\d+)\s?(l)/i,
        /(\d*[\.,]?\d+)\s?(ml)/i,
        /(\d*[\.,]?\d+)\s?(cl)/i,
        /(\d*[\.,]?\d+)\s?(cm)(?!\w+)/i,
        /(\d*[\.,]?\d+)\s?(gr)/i,
        /(\d*[\.,]?\d+)\s?(g)(?!\w+)/i,
        /(\d*[\.,]?\d+)\s?(mg)/i,
        /(\d*[\.,]?\d+)\+?\s?(kg)/i,
        /(\d*[\.,]?\d+)\s?(oz)/i,
        /(\d*[\.,]?\d+)\s?(slice[s]?)/i,
        /(\d*[\.,]?\d+)\s?(sachet[s]?)/i,
        /(\d*[\.,]?\d+)\s?(tablet[s]?)/i,
        /(\d*[\.,]?\d+)\s?(tab[s]?)/i,
        /(\d*[\.,]?\d+)\s?(catridge[s]?)/i,
        /(\d*[\.,]?\d+)\s?(sheet[s]?)/i,
        /(\d*[\.,]?\d+)\s?(stick[s]?)/i,
        /(\d*[\.,]?\d+)\s?(bottle[s]?)/i,
        /(\d*[\.,]?\d+)\s?(caplet[s]?)/i,
        /(\d*[\.,]?\d+)\s?(roll[s]?)/i,
        /(\d*[\.,]?\d+)\s?(tip[s]?)/i,
        /(\d*[\.,]?\d+)\s?(bundle[s]?)/i,
        /(\d*[\.,]?\d+)\s?(pair[s]?)/i,
        /(\d*[\.,]?\d+)\s?(set)/i,
        /(\d*[\.,]?\d+)\s?(kit)/i,
        /(\d*[\.,]?\d+)\s?(pc[s]?)/i,
        /(\d*[\.,]?\d+)\s?(box)/i,
        /(\d*[\.,]?\d+)\s?(per\s?pack)/i,
        /(\d*[\.,]?\d+)\s?(pack)/i,
        /(\d*[\.,]?\d+)\s?(s)(?!\w+)/i,
        /(\d*[\.,]?\d+)\s?(mm)(?!\w+)/i,
        /(\d*[\.,]?\d+)\s?(m)(?!\w+)/i,
        /(\d*[\.,]?\d+)\s?(page[s]?)[^A-Za-z]?/i,
        /(\d*[\.,]?\d+)\s?(bag)[^A-Za-z]?/i,
    ]
    size_regex.find {|sr| name =~ sr}
    std = $1
    unit_std = $2
    size_std = std.gsub(',','.').to_f rescue nil
    size_unit_std = unit_std

    if size_std
        if size_std > 2000
            size_std = nil
            size_unit_std = nil
        end
    end

    sku = nil

    product_pieces_regex = [
        /(\d+)\s?per\s?pack/i,
        /(\d+)\s?pack/i,
        /pack\s(\d+)/i,
        /(\d+)\s?pcs?/i,
        /(\d+)\s?hojas/i,
        /(\d+)\s?piezas/i,
        /(\d+)\s?pzs/i,
        /(\d+)\s?unid/i,
        /(\d+)\s?un(?!\w+)/i,
        # /(\d+)\s?u/i,
    ].find {|ppr| name =~ ppr}
    product_pieces = product_pieces_regex ? $1.to_i : 1
    product_pieces = 1 if product_pieces == 0
    product_pieces ||= 1

    description = html.at_css('span.description-detail') ? html.at_css('span.description-detail').text.strip : nil
    img_url = html.at_css('img.GalleryImg')['src']
    img_url = img_url.include?('https:') ? img_url : nil
    barcode = competitor_product_id.to_s

    is_available = true

    is_promoted = false
    type_of_promotion = nil
    promo_attributes = nil
    is_private_label = !(brand.downcase.include?('tottus'))

    item_identifiers = JSON.generate({
        "barcode" => "'#{barcode}'"
    })

    product = {
        _id: competitor_product_id,
        _collection: "products",
        competitor_name: "TOTTUS",
        competitor_type: "dmart",
        store_name: nil,
        store_id: nil,
        country_iso: "PE",
        language: "SPA",
        currency_code_lc: "SOL",
        scraped_at_timestamp: Time.now.strftime('%Y-%m-%d %H:%M:%S'),
        competitor_product_id: competitor_product_id,
        name: name,
        brand: brand,
        category_id: nil,
        category: var['cat'],
        sub_category: nil,
        customer_price_lc: customer_price_lc,
        base_price_lc: base_price,
        has_discount: has_discount,
        discount_percentage: discount_percentage,
        rank_in_listing: var['rank'],
        page_number: var['page_number'],
        product_pieces: product_pieces,
        size_std: size_std,
        size_unit_std: size_unit_std,
        description: description,
        img_url: img_url,
        barcode: barcode,
        sku: sku,
        url: page["url"],
        is_available: is_available,
        crawled_source: "WEB",
        is_promoted: is_promoted,
        type_of_promotion: type_of_promotion,
        promo_attributes: promo_attributes,
        is_private_label: is_private_label,
        latitude: nil,
        longitude: nil,
        reviews: nil,
        store_reviews: nil,
        item_attributes: nil,
        item_identifiers: item_identifiers,
        country_of_origin: nil,
        variants: nil,
    }

    outputs << product
end