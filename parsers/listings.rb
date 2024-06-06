if page['failed_response_status_code']
    if page['refetch_count'] < 3
        refetch page['gid']
    else
        pages << {
            url: page['vars']['ori_url'],
            page_type: "listing_html",
            no_redirect: true,
            vars: page['vars']
        }
    end
else
    json1 = JSON.parse(content)
    File.open("122.json","w") do |f|
        f.write(JSON.pretty_generate(json1))
    end
    # json = JSON.parse(content)['data']
    # vars = page['vars']

    # if json['results'] or json['pagination']
    #     products = json['results']

    #     if products.count > 0
    #         products.each_with_index do |prod, i|
    #             pages << {
    #                 url: prod['url'],
    #                 page_type: "products",
    #                 driver: {
    #                     name: "from_api"
    #                 },
    #                 vars: vars.merge("rank"=>(i+1), "prod"=>prod, "listings_gid"=>page['gid'])
    #             }
    #         end
    #     else
    #         outputs << {
    #             _collection: "subcat_dont_have_product",
    #             vars: vars
    #         }
    #     end


    #     if vars['pn'] == 1
    #         total = json['pagination']['count'].to_f
    #         perpage = json['pagination']['perPage'].to_f
    #         max_page = (total/perpage).ceil

    #         (2..max_page).each do |pn|
    #             pages << {
    #                 url: page['url'].gsub("page=1", "page=#{pn}"),
    #                 page_type: "listings",
    #                 http2: true,
    #                 headers: page['headers'],
    #                 vars: vars.merge("pn"=>pn)
    #             }
    #         end
    #     end
    # else
    #     pages << {
    #         url: vars['ori_url'],
    #         page_type: "listing_html",
    #         no_redirect: true,
    #         vars: vars
    #     }
    # end
    nokogiri = Nokogiri.HTML(content)
    script_text = nokogiri.at_css('body > script#__NEXT_DATA__').text.strip
    json = JSON.parse(script_text)
    File.open("jobs1234.json","w") do |f|
        f.write(JSON.pretty_generate(json))
    end
    build_id = json['buildId']
    File.open("baru.json","w") do |f|
        f.write(JSON.pretty_generate(build_id))
    end
end