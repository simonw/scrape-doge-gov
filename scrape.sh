#!/bin/bash

pwd

shot-scraper har https://doge.gov/ -o index.zip --wait 2000 \
  --proxy-server $PROXY_SERVER --proxy-username $PROXY_USERNAME --proxy-password $PROXY_PASSWORD
shot-scraper har https://doge.gov/savings -o savings.zip --wait 2000 \
  --proxy-server $PROXY_SERVER --proxy-username $PROXY_USERNAME --proxy-password $PROXY_PASSWORD
shot-scraper har https://doge.gov/spend -o spend.zip --wait 2000 \
  --proxy-server $PROXY_SERVER --proxy-username $PROXY_USERNAME --proxy-password $PROXY_PASSWORD
shot-scraper har https://doge.gov/workforce -o workforce.zip --wait 2000 \
  --proxy-server $PROXY_SERVER --proxy-username $PROXY_USERNAME --proxy-password $PROXY_PASSWORD
shot-scraper har https://doge.gov/regulations -o regulations.zip --wait 2000 \
  --proxy-server $PROXY_SERVER --proxy-username $PROXY_USERNAME --proxy-password $PROXY_PASSWORD

python extract_har.py index.zip application/json -o . --paths --pretty-json
python extract_har.py savings.zip application/json -o . --paths --pretty-json
python extract_har.py spend.zip application/json -o . --paths --pretty-json
python extract_har.py workforce.zip application/json -o . --paths --pretty-json
python extract_har.py regulations.zip application/json -o . --paths --pretty-json

find .

rm *.zip
