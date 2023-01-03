html = Nokogiri::HTML(content)

script = html.at_css('script#__NEXT_DATA__').text
json = JSON.parse(script)

categories = json['props']['pageProps']['serverData']['headerData']['taxonomy']['entry']['all_accesses']['categories']

if categories.count > 0
    categories.each do |category|
        cat = category['item_name']

        subcats = category['second_level_categories']
        
        if subcats.count > 0
            subcats.each do |subcat|
                cat2 = subcat['item_name']
                subcats2 = subcat['third_level_categories']

                if subcats2.count > 0
                    subcats2.each do |subcat2|
                        next if subcat2['item_name'] =~ /Ver todo/i

                        cat3 = subcat2['item_name']

                        url = subcat2['item_url'].split('/')
                        category_name = url.last
                        category_id = url[-2]

                        pages << {
                            url: "https://www.falabella.com.pe/s/browse/v1/listing/pe?page=1&categoryId=#{category_id}&categoryName=#{category_name}&pgid=2&pid=799c102f-9b4c-44be-a421-23e366a63b82&zones=912_LIMA_2%2CURBANO_83%2COLVAA_36%2C912_LIMA_1%2C150101%2CIBIS_21%2CPERF_TEST%2C150000",
                            page_type: "listings",
                            vars: {
                                pn: 1,
                                cat: cat,
                                subcat: "#{cat2} > #{cat3}",
                            }
                        }
                        save_pages pages if pages.count > 99
                    end
                else
                    outputs << {
                        _collection: "subcat_dont_have_child",
                        field_json:subcat
                    }
                    save_outputs outputs if outputs.count > 99
                end
            end
        else
            outputs << {
                _collection: "category_dont_have_subcat",
                field_json:category
            }
            save_outputs outputs if outputs.count > 99
        end

    end
else
    raise "categories can't be null"
end