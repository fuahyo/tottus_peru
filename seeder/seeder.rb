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
        'User-Agent'=>'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0',
        'Accept'=>'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
        'Accept-Language'=>'en-US,en;q=0.5',
        'Accept-Encoding'=>'gzip, deflate, br',
        'Connection'=>'keep-alive',
        'Cookie'=>'__CO_exp=comCo-72; experience=CATALYST; _gcl_au=1.1.1989925472.1700590568; _vis_opt_s=2%7C; _ga_FFJD2T07QE=GS1.1.1701700786.2.0.1701700786.60.0.0; _ga=GA1.3.1449691028.1700590570; cf_clearance=i031SK1p.8H.8PUkODD70cl0AEO4XuIJUGstorG5MmI-1701700786-0-1-ccefcd60.cd6fde1b.9bee9280-0.2.1701700786; s_nr365=1701700787851-Repeat; ba_test_id=110637534; kndctr_867134FA53CCF4BE0A490D44_AdobeOrg_identity=CiY2NTEyNTExOTY4MTQxMDY4NDM3MjEzNzQ4ODU0MjIyMzUyNDg4NFITCMyz45i_MRABGAEqBFNHUDMwAPAB3sKVqsMx; AMCV_867134FA53CCF4BE0A490D44%40AdobeOrg=MCMID|65125119681410684372137488542223524884; ABTasty=uid=ngdcw5j5027ck2qy&fst=1700590574571&pst=1700590574571&cst=1701700789344&ns=2&pvt=2&pvis=1&th=; _tt_enable_cookie=1; _ttp=PFsrE7xxS60nbteASDmkc6ifsYs; _fbp=fb.2.1700590574934.2128497611; __rtbh.lid=%7B%22eventType%22%3A%22lid%22%2C%22id%22%3A%22Qyr9WaNKBAVcZhXdTGyT%22%7D; _vwo_uuid_v2=D56DD6656239A06D55DDDF4B4C8E704E7|07668611cd1de0f971a6b55f60d7e4e3; mdLogger=false; kampyle_userid=77a7-1a39-2f87-e5f5-8e3d-b56b-83a7-2a5d; kampyleUserSession=1701700791376; kampyleSessionPageCounter=1; kampyleUserSessionsCount=2; __cf_bm=I0lt98vT_CVBsi8Ag.tucCRru0NG2_KxfRQeln8_4IY-1701700782-0-AV8TvMljFhApWlxQ8A8esfVW5UHa1lkStHj3Vc7BFLLSuz6xcmMFbQZB3eqj8s+4pVjlyGSq+OzPuerUixUIuhmNH9rkQX/1QrbCLgC9+5DG; seller_experience=MARKETPLACE; brand_experience=MARKETPLACE; __CONTENT_exp=ct-8; vwo_script=0; abtasty_script=0; session_id_fl_=1701700783320.959776ub,1701700785577; _vis_opt_test_cookie=1; asid=389c9486a70a40dfbce8dd5f36949de9-1701743986754; userSessionId=Mzg5Yzk0ODZhNzBhNDBkZmJjZThkZDVmMzY5NDlkZTktMTcwMTc0Mzk4Njc1NA==; s_ips=600; s_tp=5998; s_ppv=tottus%2520home%2C16%2C10%2C947%2C1%2C9; gpv_URL=https%3A%2F%2Ftottus.falabella.com.pe%2Ftottus-pe; kndctr_867134FA53CCF4BE0A490D44_AdobeOrg_cluster=sgp3; ABTastySession=mrasn=&lp=https%253A%252F%252Ftottus.falabella.com.pe%252Ftottus-pe; _gid=GA1.3.367789147.1701700789; _dc_gtm_UA-163888799-1=1; _hjSessionUser_1501246=eyJpZCI6IjNmMjhiNzdiLTg2MWEtNTdhOC1iN2VmLTk3ZjI4Nzg5Y2MzMyIsImNyZWF0ZWQiOjE3MDE3MDA3OTE3ODYsImV4aXN0aW5nIjp0cnVlfQ==; _hjFirstSeen=1; _hjIncludedInSessionSample_1501246=1; _hjSession_1501246=eyJpZCI6ImY4NjZmNDVmLTEzMGItNDRkMy1iYTYxLTcwYjZmMTk3ODY0MiIsImNyZWF0ZWQiOjE3MDE3MDA3OTE3ODcsImluU2FtcGxlIjp0cnVlLCJzZXNzaW9uaXplckJldGFFbmFibGVkIjpmYWxzZX0=; _hjAbsoluteSessionInProgress=0',
        'Upgrade-Insecure-Requests'=>'1',
        'Sec-Fetch-Dest'=>'document',
        'Sec-Fetch-Mode'=>'navigate',
        'Sec-Fetch-Site'=>'cross-site',
        'Sec-Fetch-User'=>'?1',
        'TE'=>'trailers',
    },
    page_type: "categories"
}