
To lanch service:

    ruby boot.rb

To check response via shell:

    curl -v  -H "Accept: application/json" -H "Content-type: application/json"  -k -X POST  http://localhost:4567/quotes -d '{ "quote": {"pickup_postcode": "SW1A 1AA", "delivery_postcode": "EC2A 3LT", "vehicle": "car" } }'
