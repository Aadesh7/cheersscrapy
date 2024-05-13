import csv
import requests
import json

def fetch_products_from_api(api_url):
    try:
        response = requests.get(api_url)
        response.raise_for_status()
        response_str = response.text
        response_json = json.loads(response_str)
        return response_json["products"]
    except requests.exceptions.RequestException as e:
        print("Error fetching data:", e)
        return None

def filter_products(products):

    filtered_products = []

    for product in products:
        # print(product["id"])
        # raise SystemExit("done")
        json_object = {}
        json_object["id"] = product["id"]
        json_object["name"] = product["name"]
        json_object["description"] = product["description"]
        json_object["price"] = product["salePrice"]
        json_object["category"] = product["category"]["name"]
        json_object["name"] = product["name"]
        
        filtered_products.append(json_object)
    
    return filtered_products

def write_products_to_csv(products, csv_filename):
    if not products:
        print("No products to write.")
        return
    
    fieldnames = products[0].keys()
    with open(csv_filename, 'w', newline='') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for product in products:
            writer.writerow(product)

def main():
    api_url = "https://api.salesberry.com.np/products?filter[where][category_id]=2633&filter[skip]=0&filter[order]=dealPrice%20DESC"
    csv_filename = "products.csv"

    products = fetch_products_from_api(api_url)

    if products:
        filtered_products = filter_products(products)
        write_products_to_csv(filtered_products, csv_filename)
        print(f"Products successfully written to '{csv_filename}'.")

if __name__ == "__main__":
    main()
