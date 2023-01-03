json = JSON.parse(content)

vars = page['vars']

products = json['results']

if products.count > 0
    products.each_with_index do |prod, i|
        pages << {
            url: prod['url'],
            page_type: "products",
            vars: vars.merge("rank"=>(i+1), "prod"=>prod, "listings_gid"=>page['gid'])
        }
    end
else
    outputs << {
        _collection: "subcat_dont_have_product",
        vars: vars
    }
end


if vars['pn'] == 1
    total = json['pagination']['count'].to_f
    perpage = json['pagination']['perPage'].to_f
    max_page = (total/perpage).ceil

    (2..max_page).each do |pn|
        pages << {
            url: page['url'].gsub("page=1", "page=#{pn}"),
            page_type: "listings",
            vars: vars.merge("pn"=>pn)
        }
    end
end