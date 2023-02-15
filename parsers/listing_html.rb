
vars = page['vars']
if page['response_status_code'] == 307 or page['response_status_code'] == 301 
    outputs << {
        _collection: "category_redirect",
        vars: vars,
        url: page['url']
    }
elsif page['failed_response_status_code'] == 403 or content.nil?
    if page['refetch_count'] < 3
        refetch page['gid']
    else
        if page['fetch_type'] == "standard"
            pages << {
                page_type: "listing_html",
                url: page['url'],
                fetch_type: "browser",
                driver: {
                    name: "browser"
                },
                vars: vars
            }
        else
            outputs << {
                _collection: "fail_to_get_listing",
                vars: vars,
                url: url,
            }
        end
    end
else
    # File.write("test.html", content)
    html = Nokogiri::HTML(content.force_encoding('UTF-8'))
    products = html.css('#testId-searchResults-products .search-results-4-grid')
    products = html.css('#testId-searchResults-products .search-results-2-grid') if products.empty? 
    
    products.each_with_index do |prod, i|
        link = prod.at_css('a.layout_view_4_GRID')['href'] rescue nil
        link = prod.at_css('a.pod-link')['href'] if link.nil?

        pages << {
            url: link,
            page_type: "product_html",
            vars: vars.merge("rank"=>(i+1), "listing_gid"=>page['gid'])
        }
    end


    if vars['pn'] == 1
        total = html.at_css("#search_numResults")['data-results'].to_f

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