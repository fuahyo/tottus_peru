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
    url: "https://tottus.falabella.com.pe",
    http2: true,
    headers: {
        'User-Agent'=>'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:123.0) Gecko/20100101 Firefox/123.0',
        'Accept'=>'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
        'Accept-Language'=>'en-US,en;q=0.5',
        'Accept-Encoding'=>'gzip, deflate, br',
        'Connection'=>'keep-alive',
        'Cookie'=>'__cf_bm=1Bcl2l99OacKriLV7mTIw.1nlU.TS2NupJMFHOjKfv0-1709559103-1.0.1.1-ZxZQS5aYSs.fR5kZXzPa4VnQMCmvA7cAWMSAwpg1y9MbuKDX66HW1BQ3UMBwiy_NJECUp2YO3KZ7vQhlepQqCfJw3N6NWXGkCtcy8g81x9E; _cfuvid=7U_L4Yc5qnocE3PSnO0aUBcKyvkMkJ5Weg58ASbl0Hk-1709559103310-0.0.1.1-604800000; __CO_exp=comCo-61; experience=CATALYST; seller_experience=MARKETPLACE; brand_experience=MARKETPLACE; __CONTENT_exp=ct-9; _gcl_au=1.1.147167320.1709559108; session_id_fl_=1709559107814.6nxsqox,1709559107816; _ga_FFJD2T07QE=GS1.1.1709559108.1.1.1709559109.59.0.0; _ga=GA1.3.1616039887.1709559109; cf_clearance=Mdm7D.8v26HbraY9zm_.K2bbBP2TY9bE1fb0VXiS87o-1709559109-1.0.1.1-iHVgBJd04FJQ9TuZolYxn6.psiELlhQD2fq_cxhT5376iqgo06F2D8zn1X0lw0LCkpeFNp1rgg0gISj8R5ewjw; asid=0bd7d60488af489cae485638ada9569a-1709602309820; userSessionId=MGJkN2Q2MDQ4OGFmNDg5Y2FlNDg1NjM4YWRhOTU2OWEtMTcwOTYwMjMwOTgyMA==; s_ips=963; s_tp=3726; s_ppv=tottus%2520home%2C30%2C26%2C1101%2C1%2C3; gpv_URL=https%3A%2F%2Ftottus.falabella.com.pe%2Ftottus-pe; s_nr365=1709559110582-New; _vwo_uuid_v2=DF1064425DF3635FF8C19BF031BAE26B1|6874a4cae6ffdd7652d6ed379b6fb25b; _gid=GA1.3.1616922958.1709559113; _dc_gtm_UA-163888799-1=1; cto_bundle=zs44R19uSGE1QTVHMlhwYjdhN01OdkhOdGxGblh3R1pFdUhIWG5qNmZOY0tWaFZyJTJCMGlDdWxMWDFydkFKWGd5VUZkdiUyRlNQbFE0NDBvS1loTWhzRGk2Sk9DMSUyRm5sOE1HM3ElMkI5aVNCSkNla01ZVDRkeDdkQWdmOVBMWGkzREd4SVJsQ21qbCUyQlY3UzdSUjAyZVp2eDk3cHpvdVR3JTNEJTNE; __rtbh.lid=%7B%22eventType%22%3A%22lid%22%2C%22id%22%3A%22udfFm3PJYOQrjOQkz2rL%22%7D; _tt_enable_cookie=1; _ttp=sxao9B-5Xx_04R68XTnKbNC6BQ8; _fbp=fb.2.1709559113265.652698003; kndctr_867134FA53CCF4BE0A490D44_AdobeOrg_cluster=sgp3; kndctr_867134FA53CCF4BE0A490D44_AdobeOrg_identity=CiY1OTYwMDAzMjc1MjI1MjU1MjM0NDEwODU4NjgyNzMwNzc0MDY5MFITCIHNp83gMRABGAEqBFNHUDMwAPABgc2nzeAx; AMCV_867134FA53CCF4BE0A490D44%40AdobeOrg=MCMID|59600032752252552344108586827307740690; mdLogger=false; kampyle_userid=777c-3bef-6b7b-1817-5d1b-c292-bdf2-7591; kampyleUserSession=1709559114584; kampyleSessionPageCounter=1; kampyleUserSessionsCount=1; kampyleUserPercentile=74.69906087765061; _hjSessionUser_1501246=eyJpZCI6ImEwMzkxMmFhLThmNjYtNWYzMy05MzM5LTc0ODFkNTZmNGZhMSIsImNyZWF0ZWQiOjE3MDk1NTkxMTU0MDksImV4aXN0aW5nIjp0cnVlfQ==; _hjSession_1501246=eyJpZCI6IjkyNWFiNzE5LTQxMDAtNDQxZS1hM2E4LWRiMjIzOGNjNGJkOSIsImMiOjE3MDk1NTkxMTU0MTAsInMiOjEsInIiOjAsInNiIjowLCJzciI6MCwic2UiOjAsImZzIjoxLCJzcCI6MX0=',
        'Upgrade-Insecure-Requests'=>'1',
        'Sec-Fetch-Dest'=>'document',
        'Sec-Fetch-Mode'=>'navigate',
        'Sec-Fetch-Site'=>'cross-site',
        'Sec-Fetch-User'=>'?1',
        'TE'=>'trailers',
    },
    page_type: "categories"
}