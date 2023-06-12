if page['failed_response_status_code'] or content.nil?
    if page['refetch_count'] < 2
        refetch page['gid']
    else
        if page['fetch_type'] == "standard"
           pages << {
            page_type: "products",
            url: page['url'],
            fetch_type: "browser",
            driver: {
                name: "browser"
            },
            vars: page['vars']
           }
        else
            outputs << {
                _collection: "failed_to_get_product",
                vars: page['vars']
            }
        end
    end
else
    html = Nokogiri.HTML(content.force_encoding("utf-8"))

    var = page['vars']
    prod = var['prod']

    # script = html.css('script[type="application/ld+json"]')[1].text
    # json = JSON.parse(script)
    competitor_product_id = prod['productId']

    name = prod['displayName']
    brand = prod['brand']
    brand = html.at_css('.product-brand')['data-brand'] if brand.nil? or brand.empty?

    price = prod['prices']
    base_price_lc = price.find{|p| p['type'] =~ /normalPrice/i}['price'].first.gsub(",", "").to_f rescue price.first['price'].first.gsub(",", "").to_f
    customer_price_lc = base_price_lc

    if price.count > 1
        cust_price = price.find{|p| !(p['type'] =~ /normalPrice/i)}
        if cust_price
            customer_price_lc = cust_price['price'].first.gsub(",", "").to_f

            cust_price_type = cust_price['type']
            base_price = price.find{|p| p['type'] != cust_price['type'] }
            base_price_lc = base_price['price'].first.gsub(",", "").to_f if base_price
        end
    end

    has_discount = false
    discount_percentage = nil

    if customer_price_lc < base_price_lc
        has_discount = true
        discount_percentage = (((base_price_lc - customer_price_lc) / base_price_lc) * 100).round(7)
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

    sku = prod['skuId']

    product_pieces_regex = [
        /(\d+)\s?per\s?pack/i,
        /(\d+)\s?pack/i,
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

    description_container = html.css('.nutrition-description-container div')
    description_array = []

    description_container.each do |desc|
        next if desc['class'] =~ /certificates/i

        description_array << desc.text.strip
    end

    description = description_array.join("")

    img_url = prod['mediaUrls'].first
    barcode = nil

    is_available = true

    promo = []

    if prod['discountBadge']
        if prod['discountBadge']['label']
            promo << "'#{prod['discountBadge']['label']}'"
        end
    end

    prod['badges'].each do |pr|
        promo << "'#{pr['label']}'"
    end

    prod['multipurposeBadges'].each do |pr|
        promo << "'#{pr['label']}'"
    end

    is_promoted = false
    type_of_promotion = nil
    promo_attributes = nil

    if promo.count > 0
        is_promoted = true
        type_of_promotion = "badges"
        promo_attributes = {
            promo_detail: promo.join(",")
        }.to_json
    end



    is_private_label = (brand.nil? or brand.empty?) ? nil : !(brand.downcase.include?('tottus')) 

    item_identifiers = nil

    item_attributes_container = description_container.css('.certificate-icon-wrapper')
    item_attributes_arr = []

    item_attributes_container.each do |ia|
        item_attributes_arr << "'#{ia.text.strip}'"
    end

    item_attributes = nil
    if item_attributes_arr.count > 0
        item_attributes = {
            item_badge: item_attributes_arr.join(',')
        }.to_json
    end

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
        scraped_at_timestamp: (ENV['reparse'] == "1" ? (Time.parse(page['fetched_at']) + 1).strftime('%Y-%m-%d %H:%M:%S') : Time.parse(page['fetched_at']).strftime('%Y-%m-%d %H:%M:%S')),
        competitor_product_id: competitor_product_id,
        name: name,
        brand: brand,
        category_id: nil,
        category: var['cat'],
        sub_category: var['subcat'],
        customer_price_lc: customer_price_lc,
        base_price_lc: base_price_lc,
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
        item_attributes: item_attributes,
        item_identifiers: item_identifiers,
        country_of_origin: nil,
        variants: nil,
        processed: "0"
    }

    outputs << product

    pages << {
        url: "https://api.bazaarvoice.com/data/products.json?passkey=2xga75eqgl9scx29oke8xx11r&locale=es_PE&allowMissing=true&apiVersion=5.4&filter=id:#{competitor_product_id}",
        page_type: "barcode",
        no_url_encode: true,
        vars: {
            productId: competitor_product_id,
            product_gid: page['gid'],
            listings_gid: var['listings_gid']
        }
    }


    pages << {
        url: "https://api.bazaarvoice.com/data/display/0.2alpha/product/summary?PassKey=2xga75eqgl9scx29oke8xx11r&productid=#{competitor_product_id}&contentType=reviews,questions&reviewDistribution=primaryRating,recommended&rev=0&contentlocale=es_AR,es_CL,es_PE,es_BO,es_CR,es_SV,es_EC,es_HN,es_NI,es_GT,es_DO,es_PR,es_PY,es_PA,es_UY,es_ES,es_US,es_MX,es_CO",
        page_type: "rating",
        no_url_encode: true,
        vars: {
            productId: competitor_product_id,
            product_gid: page['gid'],
            listings_gid: var['listings_gid']
        }
    }
end