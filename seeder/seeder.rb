# category_link = ["supermercado-ttsuper","cmr-days-8882278","bebes-y-ninos-ttbebes","electrodomesticos-ttelectro","tecnologia-tttecno","dormitorio-ttdor","hogar-tthogar","deportes-ttdeportes","moda-ttmoda","preciazos-ttpreciazos"]

# category_link.each do |category|
#     pages << {
#         url: "https://www.tottus.com.pe/#{category}/c/?sort=popularity",
#         page_type: 'listings',
#         fetch_type: 'browser',
#         vars: {
#             page_number: 1
#         }
#     }
# end

pages << {
    url: "https://gum.criteo.com/sid/json?origin=onetag&domain=falabella.com.pe&sn=ChromeSyncframe&so=undefined&topUrl=tottus.falabella.com.pe&bundle=vRik-185U0ROU213SEthYWlpU2U4RzZ3dHdkZjA5dWRFZHBMc1VmMEUxcnJzRjcyZWpJYzk4VjFzV0lvRVUyS3JxOTlnRzdkdnROb3I0d2d3MGlzT2NMV1F3S0Jua3JJT1hDZXRaTHA2cHBpRDVhS2lmdGhLeUxxeHAwZG9mcjVJWlBDVU9lQmRpa3FvMEVHWlYlMkJPOUdMT0ZpR2ZtdVRGNlpEU0ZXNGpWYmlISkxiejk1UHZ0TVFNaDJUQmxnTWY5TG9PaDlVRnJ4cUNiZE5idUQxdDdubSUyQmxNZyUzRCUzRA&cw=1&lsw=1&topicsavail=0&fledgeavail=0",
    # url: "https://app.scrapingbee.com/api/v1/?api_key=RXCQIS4NMT5AUECHPXCXXX321V8TMPH9A41LUFCNDJR9M8DMNZL5W16OTOIWMT40PYY250HQ3J5SR77R&url=https%3A%2F%2Ftottus.falabella.com.pe",
    # http2: true,
    # headers: {
    #     'User-Agent'=>'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36',
    #     'Accept'=>'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
    #     'Accept-Language'=>'en-US,en;q=0.9',
    #     'Accept-Encoding'=>'gzip, deflate, br, zstd',
    #     'Connection'=>'keep-alive',
    #     'Cookie'=>'__cf_bm=3YFoIsj_ATEgCvtJx67m4o7K8WWzUqluZG_knVALUL4-1713447224-1.0.1.1-3dx26n2jg76VB7hwkNdRscm8nEmQQwippA5Ft1HVOP4qk3ACp5jsXNB8xFX.1Fw5UDayG6sEsiJ0wr0LuOZ_pwhxuJ2GHyzi7xTWc32tnHE; _cfuvid=JqF_cj24.lFkEFMkme.kKCQcEMuocVp0uECOgrzmr90-1713447224402-0.0.1.1-604800000; __CO_exp=comCo-28; experience=CATALYST; seller_experience=MARKETPLACE; brand_experience=MARKETPLACE; __CONTENT_exp=ct-45; _gcl_au=1.1.1829138110.1713447227; session_id_fl_=1713447226842.ysdpwwl4,1713447226844; _ga_FFJD2T07QE=GS1.1.1713447226.1.0.1713447226.60.0.0; _ga=GA1.3.1400718448.1713447227; _gid=GA1.3.1158366920.1713447227; _dc_gtm_UA-163888799-1=1; __rtbh.lid=%7B%22eventType%22%3A%22lid%22%2C%22id%22%3A%22tOATVy3GL4F7rZGhVYMS%22%7D; _vwo_uuid_v2=D5A667DD12C9FDAB1ABE755C908751375|3d4cafc82d7859425745bfac4f58831c; cf_clearance=2JiEZ00JnFtP6yKkfxSLWEj43jowWqCQg1oSbfSPnto-1713447227-1.0.1.1-MrC1_LHd1PwHvuJMeY8vPnHvcKwskKOp62r8swI9YzYBdLrHCiG8cYkPTRvBJ.tZho5FnPsG.HslbJUVzfo2gw; _tt_enable_cookie=1; _ttp=Sqsh6EBUZKcCjFbsZfgtB5JJPAs; cto_bundle=oYi8Cl9RZWlLRHJ3emlsaVExbDRpYm9rNWpPaHlJeEZJUXNiTEFYczdJOUl3RDBWb1BMYlFJJTJGNiUyRjFXa2ZFNGt1ZmVadjRjSUtVYmp4bXhWYWhxbENOS3NOcVlQVUZTcVVGUXkyMEpyMExVWDFMY0pLY1ptTjlCaGo5cnpMOGFhSkY4bW90d1JqZ1RGV1BUYVVXdGhESFF5OHM1JTJGZ0FxeFNueUlKZGt3bkJCZk5XUEUlM0Q; _vwo_uuid=D5A667DD12C9FDAB1ABE755C908751375; _vwo_ds=3%241713447227%3A13.42624537%3A%3A; _vwo_sn=0%3A1%3A%3A%3A1; _vis_opt_s=1%7C; _vis_opt_test_cookie=1; _fbp=fb.2.1713447227601.1459949994; asid=e8b181c82903478c8237560f9a46cc3d-1713490428089; userSessionId=ZThiMTgxYzgyOTAzNDc4YzgyMzc1NjBmOWE0NmNjM2QtMTcxMzQ5MDQyODA4OQ==; s_ips=943; gpv_URL=https%3A%2F%2Ftottus.falabella.com.pe%2Ftottus-pe; s_nr365=1713447228128-New; kndctr_867134FA53CCF4BE0A490D44_AdobeOrg_cluster=sgp3; kndctr_867134FA53CCF4BE0A490D44_AdobeOrg_identity=CiYyMzk3MzE0NDUwMDYxNzU1Nzk5MTQ0NzAxODg2MTQzMjU3OTc3M1IRCImrp4vvMRgBKgRTR1AzMAHwAYmrp4vvMQ==; AMCV_867134FA53CCF4BE0A490D44%40AdobeOrg=MCMID|23973144500617557991447018861432579773; _hjSessionUser_1501246=eyJpZCI6IjU2ZjM4YTE2LWY1MmQtNTllZS05Y2EwLTExNDA0MjMyNzg5OSIsImNyZWF0ZWQiOjE3MTM0NDcyMjk1MzYsImV4aXN0aW5nIjp0cnVlfQ==; _hjSession_1501246=eyJpZCI6IjU4ZGY1MjAzLWEzMjgtNGQyYy05MDY2LThhYWYwMDA3ZWNhYyIsImMiOjE3MTM0NDcyMjk1MzcsInMiOjEsInIiOjAsInNiIjowLCJzciI6MCwic2UiOjAsImZzIjoxLCJzcCI6MH0=; s_tp=5142; s_ppv=tottus%2520home%2C18%2C18%2C943%2C1%2C5; mdLogger=false; kampyle_userid=8078-88b7-11b8-255d-d2e0-37ac-a16c-e694; kampyleUserSession=1713447231708; kampyleUserSessionsCount=1; kampyleSessionPageCounter=1; kampyleUserPercentile=11.281719983976867; IS_PRESSURE_MODAL_INTERACTED=true',
    #     'Upgrade-Insecure-Requests'=>'1',
    #     'Sec-Fetch-Dest'=>'document',
    #     'Sec-Fetch-Mode'=>'navigate',
    #     'Sec-Fetch-Site'=>'cross-site',
    #     'Sec-Fetch-User'=>'?1',
    #     'TE'=>'trailers',
    # },
    headers: {
        'Accept' => '*/*'
        'Accept-Encoding' => 'gzip, deflate, br, zstd',
        'Accept-Language' => 'en-US,en;q=0.9',
        'Cookie' => 'uid=fdb92d0b-5e5f-4c70-9ff9-3816c36dd4f9; receive-cookie-deprecation=1; cto_bundle=t45Sg19VNGw5N29iNXdsUDI4NzZqSmx3emRhVmNPRjBjdXZxSkxiOGFqV3kwVEdOWW00WTBQQTVFNmRsZFEwdFdnSzlS',
        'Priority' => 'u=1, i',
        'Referer' => 'https://gum.criteo.com/syncframe?topUrl=tottus.falabella.com.pe&origin=onetag',
        'Sec-Ch-Ua' => '"Google Chrome";v="125", "Chromium";v="125", "Not.A/Brand";v="24"',
        'Sec-Ch-Ua-Mobile' => '?0',
        'Sec-Ch-Ua-Platform' => '"macOS"',
        'Sec-Fetch-Dest' => 'empty',
        'Sec-Fetch-Mode' => 'cors',
        'Sec-Fetch-Site' => 'same-origin',
        'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36',
    },
    page_type: "categories"
}