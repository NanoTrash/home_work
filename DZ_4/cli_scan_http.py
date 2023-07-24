# Импортируем необходимые библиотеки
import os
import requests
import json

# Приветствие
print('\n--->>> Если не нужно сканировать сеть, просто пропустите этот шаг, нажав кнопку ENTER');

# Сканирум сеть
def do_ping_sweep(ip, num_of_host):
    while True:
        try:
            yield int(input())
        except ValueError:
            break
    ip_parts = ip.split('.')
    network_ip = ip_parts[0] + '.' + ip_parts[1] + '.' + ip_parts[2] + '.'
    scanned_ip = network_ip + str(int(ip_parts[3]) + int(num_of_host))
    response = os.popen(f'ping -c 2 {scanned_ip}')
    res = response.readlines()
    print(f"[#] Result of scanning: {scanned_ip} [#]\n{res[2]}", end='\n')
do_ping_sweep(ip=input('\nвведите ip-адрес --->>>'), num_of_host=input('введите количество хостов --->>>'));



# Производим отпраку HTTP запросов
print('\n--->>> Введите адрес для HTTP-запроса в формате: http://ya.ru --->>> GET или POST метод\n')
def sent_http_request(target, method, headers=None, payload=None):
    while True:
        try:
            yield str(input())
        except ValueError:
            break
    headers_dict = dict()
    if headers:
        for header in headers:
            header_name = header.split(':')[0]
            header_value = header.split(':')[1:]
            headers_dict[header_name] = ':'.join(header_value)
    if method == "GET":
        response = requests.get(target, headers=headers_dict)
    elif method == "POST":
        response = requests.post(target, headers=headers_dict, data=payload)
    print(
        f"[#] Response status code: {response.status_code}\n"
        f"[#] Response headers: {json.dumps(dict(response.headers), indent=4, sort_keys=True)}\n"
        f"[#] Response content:\n {response.text}"
    )


post_request_payload = None
request_target = str(input("Target:"))
request_method = str(input("Method (GET|POST):"))
request_headers = list(input("Headers (name1:value1 name2:value2 ...)").split())
if request_method == "POST":
    post_request_payload = str(input("Payload:"))

sent_http_request(request_target, request_method, request_headers, post_request_payload)
print('\nМотодец! Давай еще раз?')