html = Nokogiri.HTML(content)

var = page['vars']

category_name = html.at_css('.facet-breadcrum.active')&.text.strip
products = html.css('.product')

products.each_with_index do |product, i|

    link = product.at_css('a')['href']

    pages << {
        page_type: "products",
        url: "https://www.tottus.com.pe#{link}",
        fetch_type: 'browser',
        vars: {
            cat: category_name,
            rank: i+1,
            page_number: var['page_number']
        }
    }

end


if var['page_number'] == 1
    total_products = html.at_css('.facet-total-products')

    if total_products
        total_products = total_products.text.scan(/\d+/).first.to_f 
        total_page = (total_products/48).ceil
        
        (2...total_page).each do |page_number|
            
            pages << {
                url: page['url']+"&page=#{page_number}",
                page_type: 'listings',
                fetch_type: 'browser',
                vars: {
                    page_number: page_number
                }
            }
        end
    end
end

