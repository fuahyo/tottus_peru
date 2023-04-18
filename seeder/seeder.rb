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
    headers: {
        'User-Agent'=>'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',
        'Accept'=>'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
        'Accept-Language'=>'en-US,en;q=0.5',
        'Accept-Encoding'=>'gzip, deflate, br',
        'Connection'=>'keep-alive',
        'Cookie'=>'ABTasty=uid=zw52ssaqnktd1q00&fst=1671122104434&pst=1676463762702&cst=1677609797341&ns=10&pvt=48&pvis=2&th=; BVBRANDID=5a02e6d1-a163-4f7e-bb3f-bb916468f23f; _tt_enable_cookie=1; _ttp=lvprYjBqCYbMw7lOnKKQBc_kSh7; _ga_FFJD2T07QE=GS1.1.1681820375.12.1.1681820569.60.0.0; _ga=GA1.3.1313708878.1671122108; _vwo_uuid_v2=D007F9FF5EE5115ED843DEF3E2C3D49BB|198c95994b3b0f6ab3f1c5a90401ff28; _fbp=fb.2.1671122108717.583010526; cto_bundle=H6FqyF95TTFCY1ZtTVNRTWRVenJ6Q3Z6JTJGSE9rdmZ5THdVZER3dEg0JTJGZWs3UjZnUUF6TXpBUjFwc3VHRXlMVFk4MjBjTmolMkZvbGFRV2c0MzhraVRWVDVyMU9INmRCV0M2QUdISTRzRmU5VGJKYnZkVlV3dWgzckhRVThYMjlRRHJjTE9vUFR3Nm8xZFZsJTJGJTJGTUNPRklFYWZ5OHpnJTNEJTNE; isPoliticalIdExists=true; priceGroupId=2; politicalId=799c102f-9b4c-44be-a421-23e366a63b82; zones=["912_LIMA_2","OLVAA_81","LIMA_URB1_DIRECTO","URBANO_83","IBIS_19","912_LIMA_1","150101","PERF_TEST","150000"]; zoneData=eyJ6b25lSUQiOiIxNTAwMDAiLCJ6b25lTmFtZSI6IkxJTUEifQ==; IS_ZONE_SELECTED=false; userSelectedZone=defaultZone; _dy_soct=471634.856040.1681820568*579932.1117898.1681820569; AMCV_867134FA53CCF4BE0A490D44%40AdobeOrg=1176715910%7CMCIDTS%7C19466%7CMCMID%7C10641110227188476284096680428219781210%7CMCAAMLH-1682425174%7C3%7CMCAAMB-1682425174%7C6G1ynYcLPuiQxYZrsz_pkqfLG9yMXBpb2zX5dvJdYQJzPXImdj0y%7CMCOPTOUT-1681827574s%7CNONE%7CMCAID%7CNONE%7CMCSYNCSOP%7C411-19473%7CvVersion%7C5.4.0; syte_uuid=771a62f0-7c96-11ed-92a7-bfc7753ec2e9; s_ecid=MCMID%7C10641110227188476284096680428219781210; personalisation_session_skus_ls={%2263304518%22:[%22115850341%22%2C%22116149228%22]}; s_vnum=1702658124701%26vn%3D10; s_lv=1681820571038; mdLogger=false; kampyle_userid=e7fb-6401-7d58-a8ec-c81a-2026-ffd9-8b64; kampyleUserSession=1681820571028; kampyleSessionPageCounter=1; kampyleUserSessionsCount=22; _hjSessionUser_1501246=eyJpZCI6IjQyMjE5NDNkLTk1ODgtNTM1MS1hM2ExLWY0MTM0Mjg0MmNhNyIsImNyZWF0ZWQiOjE2NzExMjIxMjU1ODcsImV4aXN0aW5nIjp0cnVlfQ==; _dyid_server=-3715469484751106872; syte_ab_tests={}; VIEW_MODAL_TOTTUSPE=ENABLED; _vwo_uuid_v2=D007F9FF5EE5115ED843DEF3E2C3D49BB|198c95994b3b0f6ab3f1c5a90401ff28; __gads=ID=a4222a574bbff2f9:T=1672755026:S=ALNI_MZ5lSiNJg7SLtgOjWtdgM1uvOKAAw; __gpi=UID=00000b9d67f66254:T=1672755026:RT=1672928419:S=ALNI_MYRWTnWNCDJX3vXNJh4c8gzUPO6gw; __cf_bm=JY5RgCPKyT84cU7ywnHU4Uw5_pdViCNB.DCNiP4ucAg-1681820569-0-AbWtvsa+f/a78ih9cpFmPTw9A0XZn14IL8mRVsJaPJb5uDf2flr1VhE6fMpYo4AOFbqAUMow1xACapkizYMCiRJeEE1hBvtcjrpNBwt4RUnupk1dOeRZ1yGdfu6l+KwY3yk1pAXmvLeXqi0D9/+UuL+/Vi3KOFJCLkLfLB8doeOH; __CO_exp=comCo-53; experience=CATALYST; seller_experience=MARKETPLACE; brand_experience=MARKETPLACE; __CONTENT_exp=ct-22; vwo_script=0; abtasty_script=0; _gcl_au=1.1.2088246215.1681820374; session_id_fl_=1681820374480.4rtxqxwn,1681820569146; AMCVS_867134FA53CCF4BE0A490D44%40AdobeOrg=1; _dyjsession=83tjzlxncmkfg2yjyswpg8ehaw5gnuai; dy_fs_page=tottus.falabella.com.pe%2Ftottus-pe; _dy_csc_ses=83tjzlxncmkfg2yjyswpg8ehaw5gnuai; _dy_c_exps=; _dy_c_att_exps=; _dycnst=dg; stimgs={%22sessionId%22:62494933%2C%22didReportCameraImpression%22:false%2C%22newUser%22:false}; _dyid=-3715469484751106872; _dycst=dk.w.f.ws.; _dy_geo=ID.AS.ID_RI.ID_RI_Pekanbaru; _dy_df_geo=Indonesia..Pekanbaru; _dy_toffset=0; asid=1ce6a6a6c4e44829947964a12ed6f56c-1681863575741; userSessionId=MWNlNmE2YTZjNGU0NDgyOTk0Nzk2NGExMmVkNmY1NmMtMTY4MTg2MzU3NTc0MQ==; _gid=GA1.3.1425361276.1681820378; _dc_gtm_UA-163888799-1=1; s_nr=1681820571037-New; s_invisit=true; s_lv_s=More%20than%2030%20days; gpv_pn=tottus%20home; s_ppvl=%5B%5BB%5D%5D; s_ppv=tottus%2520home%2C17%2C17%2C947%2C1920%2C309%2C1920%2C1080%2C1%2CP; s_cc=true; _hjIncludedInSessionSample_1501246=0; _hjSession_1501246=eyJpZCI6ImVhMzI1MTNhLWI0MjktNGU0YS04OTFkLTA2ZmI1ODZmYzEwZCIsImNyZWF0ZWQiOjE2ODE4MjA1NzEzOTgsImluU2FtcGxlIjpmYWxzZX0=; _hjIncludedInPageviewSample=1; _hjAbsoluteSessionInProgress=0',
        'Upgrade-Insecure-Requests'=>'1',
        'Sec-Fetch-Dest'=>'document',
        'Sec-Fetch-Mode'=>'navigate',
        'Sec-Fetch-Site'=>'cross-site',
        'Sec-Fetch-User'=>'?1',
        'TE'=>'trailers',
    },
    page_type: "categories"
}