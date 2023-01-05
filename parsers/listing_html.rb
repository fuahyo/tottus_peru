
vars = page['vars']

if page['response_status_code'] == 307 or page['response_status_code'] == 301
    outputs << {
        _collection: "category_redirect",
        vars: vars,
        url: page['url']
    }
else
    html = Nokogiri::HTML(content)
    products = html.css('#testId-searchResults-products .search-results-4-grid')

    products.each_with_index do |prod, i|
        link = prod.at_css('a.layout_view_4_GRID')['href']

        pages << {
            url: link,
            page_type: "product_html",
            vars: vars.merge("rank"=>(i+1), "listing_gid"=>page['gid'])
        }
    end

    if vars['pn'] == 1
        total = html.at_css("span#search_numResults")['data-results'].to_f
        max_page = (total/48).ceil

        (2..max_page).each do |pn|
            pages << {
                url: "#{page['url']}&page=#{pn}",
                page_type: "listing_html",
                no_redirect: true,
                vars: vars.merge("pn"=>pn) 
            }
        end
    end
end