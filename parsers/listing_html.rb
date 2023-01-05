vars = page['vars']

if page['response_status_code'] == 307
    outputs << {
        _collection: "category_redirect",
        vars: vars,
        url: page['url']
    }
else
    raise "must check"
end