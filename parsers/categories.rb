
html = Nokogiri::HTML(content.force_encoding("utf-8"))

script = html.at_css('script#__NEXT_DATA__').text
# p script
json = JSON.parse(script)

categories = json['props']['pageProps']['serverData']['headerData']['header']['sisNavigationMenu']['entry']['categories']

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
                        if url.count > 6
                            category_name = url.last
                            category_id = url[-2]
                        else
                            category_name = cat3.gsub(' ', '_')
                            category_id = url.last
                        end

                       

                        if subcat2['item_url'] =~ /catg?\d+/i

                            pages << {
                                url: "https://www.falabella.com.pe/s/browse/v1/listing/pe?page=1&subdomain=tottus&store=tottus&categoryId=#{category_id}&categoryName=#{category_name}&pgid=2&pid=799c102f-9b4c-44be-a421-23e366a63b82&zones=912_LIMA_2%2CURBANO_83%2COLVAA_36%2C912_LIMA_1%2C150101%2CIBIS_21%2CPERF_TEST%2C150000",
                                page_type: "listings",
                                http2: true,
                                headers: {
                                    'accept'=>'*/*',
                                    'accept-encoding'=>'gzip, deflate, br',
                                    'accept-language'=>'en-US,en;q=0.9',
                                    'content-type'=>'application/json',
                                    'origin'=>'https://tottus.falabella.com.pe',
                                    'referer'=>'https://tottus.falabella.com.pe/',
                                    'sec-ch-ua'=>'"Not?A_Brand";v="8", "Chromium";v="108", "Google Chrome";v="108"',
                                    'sec-ch-ua-mobile'=>'?0',
                                    'sec-ch-ua-platform'=>'"Windows"',
                                    'sec-fetch-dest'=>'empty',
                                    'sec-fetch-mode'=>'cors',
                                    'sec-fetch-site'=>'same-site',
                                    'user-agent'=>'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',
                                    'x-device-type'=>'desktop',
                                },
                                vars: {
                                    pn: 1,
                                    cat: cat,
                                    subcat: "#{cat2} > #{cat3}",
                                    ori_url: subcat2['item_url'],
                                }
                            }
                            save_pages pages if pages.count > 99
                        else
                            collection_name = url.last
                            pages << {
                                url: "https://www.falabella.com.pe/s/browse/v1/collection/pe?page=1&subdomain=tottus&store=tottus&collectionId=#{collection_name}&pgid=2&pid=799c102f-9b4c-44be-a421-23e366a63b82&zones=912_LIMA_2,URBANO_83,OLVAA_36,912_LIMA_1,150101,IBIS_21,PERF_TEST,150000",
                                page_type: "listings",
                                http2: true,
                                headers: {
                                    'accept'=>'*/*',
                                    'accept-encoding'=>'gzip, deflate, br',
                                    'accept-language'=>'en-US,en;q=0.9',
                                    'content-type'=>'application/json',
                                    'origin'=>'https://tottus.falabella.com.pe',
                                    'referer'=>'https://tottus.falabella.com.pe/',
                                    'sec-ch-ua'=>'"Not?A_Brand";v="8", "Chromium";v="108", "Google Chrome";v="108"',
                                    'sec-ch-ua-mobile'=>'?0',
                                    'sec-ch-ua-platform'=>'"Windows"',
                                    'sec-fetch-dest'=>'empty',
                                    'sec-fetch-mode'=>'cors',
                                    'sec-fetch-site'=>'same-site',
                                    'user-agent'=>'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',
                                    'x-device-type'=>'desktop',
                                },
                                vars: {
                                    pn: 1,
                                    cat: cat,
                                    subcat: "#{cat2} > #{cat3}",
                                    ori_url: subcat2['item_url'],
                                }
                            }
                            save_pages pages if pages.count > 99
                        end
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
File.open("1234.json","w") do |f|
    f.write(JSON.pretty_generate(pages))
end