category_link = ["supermercado-ttsuper","cmr-days-8882278","bebes-y-ninos-ttbebes","electrodomesticos-ttelectro","tecnologia-tttecno","dormitorio-ttdor","hogar-tthogar","deportes-ttdeportes","moda-ttmoda","preciazos-ttpreciazos"]

category_link.each do |category|
    pages << {
        url: "https://www.tottus.com.pe/#{category}/c/?sort=popularity",
        page_type: 'listings',
        fetch_type: 'browser',
        vars: {
            page_number: 1
        }
    }
end