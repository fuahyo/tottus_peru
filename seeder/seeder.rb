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
    url: "https://tottus.falabella.com.pe/tottus-pe",
    fetch_type: "browser",
    # http2: true,
    # headers: {
    #     'User-Agent'=>'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:124.0) Gecko/20100101 Firefox/124.0',
    #     'Accept'=>'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
    #     'Accept-Language'=>'en-US,en;q=0.5',
    #     'Accept-Encoding'=>'gzip, deflate, br',
    #     'Connection'=>'keep-alive',
    #     'Cookie'=>'_gcl_au=1.1.147167320.1709559108; _ga_FFJD2T07QE=GS1.1.1714998196.3.1.1714998197.59.0.0; _ga=GA1.3.1616039887.1709559109; cf_clearance=qC2.EwAGn6aiMC2mWuKfXboyA62webEoJDth6qoKUBI-1714998197-1.0.1.1-eR5RLdBMzquVoW5hZLlRwlBvafamdFLcaFOgN1Si.jO3chA2fzuPL1VrDvgfiKBC1bnzyPJoehFaOGMw62JrGw; s_nr365=1714998198503-Repeat; _vwo_uuid_v2=DF1064425DF3635FF8C19BF031BAE26B1|6874a4cae6ffdd7652d6ed379b6fb25b; cto_bundle=nH7ydV9uSGE1QTVHMlhwYjdhN01OdkhOdGxLRkNvOVpyeFFKbG4zQ3RKcE9CWld0c1BFN2hQWmxvYm94N2pzajN4dWxKcDFMNFhIeE9GVndnVTcwdkRLcWVSb2p2Y21Wdk1lJTJGQ2RjZVYlMkJkaDNOUk9nVDljaE1vOE1nalJtaEt4SndxVkJUWjZTV1kwOW1TUmF3Vm5XY0VQQjlRJTNEJTNE; __rtbh.lid=%7B%22eventType%22%3A%22lid%22%2C%22id%22%3A%22udfFm3PJYOQrjOQkz2rL%22%7D; _tt_enable_cookie=1; _ttp=sxao9B-5Xx_04R68XTnKbNC6BQ8; _fbp=fb.2.1709559113265.652698003; kndctr_867134FA53CCF4BE0A490D44_AdobeOrg_identity=CiY1OTYwMDAzMjc1MjI1MjU1MjM0NDEwODU4NjgyNzMwNzc0MDY5MFITCIHNp83gMRABGAEqBFNHUDMwAPABvIfv7vQx; AMCV_867134FA53CCF4BE0A490D44%40AdobeOrg=MCMID|59600032752252552344108586827307740690; mdLogger=false; kampyle_userid=777c-3bef-6b7b-1817-5d1b-c292-bdf2-7591; kampyleUserSession=1714998200624; kampyleSessionPageCounter=1; kampyleUserSessionsCount=3; _hjSessionUser_1501246=eyJpZCI6ImEwMzkxMmFhLThmNjYtNWYzMy05MzM5LTc0ODFkNTZmNGZhMSIsImNyZWF0ZWQiOjE3MDk1NTkxMTU0MDksImV4aXN0aW5nIjp0cnVlfQ==; __CO_exp=comCo-1; experience=CATALYST; __cf_bm=sJ52BndR26pPAzv2ji5JaA3PrvMtP7NLU2PeajMePZA-1714998193-1.0.1.1-90781tSCmtjl8es4ukjTbBg2BnGAqPvOidugv.qWOCmfvanqUUyDP4_xdoBtQdY1IKJGN8h0JWbDlNie.eX_JnHQeaaeyA0rdsyR5oa6j90; _cfuvid=aZVBy7KLtMp3pZEpvVkCyIvqpf1wHNX7CXw5irhZ34I-1714998193124-0.0.1.1-604800000; seller_experience=MARKETPLACE; brand_experience=MARKETPLACE; __CONTENT_exp=ct-52; session_id_fl_=1714998195821.9g91cg3p,1714998195825; contextID=69e12039bb03fd346044d975c09210c9; asid=505c8ef06af64fcfb272fe39e908c2c1-1715041397946; userSessionId=NTA1YzhlZjA2YWY2NGZjZmIyNzJmZTM5ZTkwOGMyYzEtMTcxNTA0MTM5Nzk0Ng==; s_ips=963; s_tp=3926; s_ppv=tottus%2520home%2C25%2C25%2C963%2C1%2C4; gpv_URL=https%3A%2F%2Ftottus.falabella.com.pe%2Ftottus-pe; _gid=GA1.3.592139759.1714998199; _dc_gtm_UA-163888799-1=1; kndctr_867134FA53CCF4BE0A490D44_AdobeOrg_cluster=sgp3; _vwo_uuid=D471E1D831CCAF3F0FF64E1F6DAE0320B; _vwo_ds=3%241714998198%3A7.45251753%3A%3A; _vwo_sn=0%3A1%3A%3A%3A1; _vis_opt_s=1%7C; _vis_opt_test_cookie=1; _hjSession_1501246=eyJpZCI6IjJmNTA2MjYwLTE1NDItNDkxYy1iMGYxLWJiOTY0NDMzM2JkYyIsImMiOjE3MTQ5OTgxOTkzMzcsInMiOjEsInIiOjAsInNiIjowLCJzciI6MCwic2UiOjAsImZzIjowLCJzcCI6MH0=; kampyleUserPercentile=29.834356823191644',
    #     'Upgrade-Insecure-Requests'=>'1',
    #     'TE'=>'trailers',
    # },
    page_type: "categories"
}