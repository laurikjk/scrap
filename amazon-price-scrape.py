import requests
from bs4 import BeautifulSoup
from datetime import datetime


def scrape_product(url):
    HEADERS = ({'User-Agent':
            'Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B405',
            'Accept-Language': 'en-US, en;q=0.5'})
    now = datetime.now().strftime('%Y-%m-%d %Hh%Mm')
    page = requests.get(url, headers=HEADERS)
    soup = BeautifulSoup(page.content, features="lxml")
            
    title = soup.find(id='productTitle').get_text().strip()
    
    try:
        price = float(soup.find(id='priceblock_ourprice').get_text().replace('.', '').replace('€', '').replace(',', '.').strip())
    except:
        try:
            price = float(soup.find(id='priceblock_saleprice').get_text().replace('$', '').replace(',', '').strip())
        except:
            try:
                price = float(soup.find(id='priceblock_dealprice').get_text().replace('$', '').replace(',', '').strip())
            except:
                price = ''

    try:
        review_score = float(soup.select('i[class*="a-icon a-icon-star a-star-"]')[0].get_text().split(' ')[0].replace(",", "."))
    except:
        try:
            review_score = float(soup.select('i[class*="a-icon a-icon-star a-star-"]')[1].get_text().split(' ')[0].replace(",", "."))
        except:
            review_score = ''

    try:
        review_count = int(soup.select('#acrCustomerReviewText')[0].get_text().split(' ')[0].replace(".", "").replace(",", ""))
    except:
        review_count = ''

    try:
        soup.select('#availability .a-color-state')[0].get_text().strip()
        stock = 'Out of Stock'
    except:
        try:
            soup.select('#availability .a-color-price')[0].get_text().strip()
            stock = 'Out of Stock'
        except:
            stock = 'Available'

    return {'date': now.replace('h',':').replace('m',''),
            'url': url,
            'title': title,
            'price': price,
            'stock': stock,
            'review_score': review_score,
            'review_count': review_count}

