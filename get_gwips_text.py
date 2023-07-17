import requests
from bs4 import BeautifulSoup as bs
import urllib3

urllib3.disable_warnings()
URL_ROOT = 'https://gwips.ucc.ie/downloads/'

for clade_option in bs(requests.get(f'{URL_ROOT}/getClade.php', verify=False).text).findAll("option"):
    clade_text = clade_option.text
    for genome_option in bs(requests.get(f'{URL_ROOT}/getGenome.php?p1={clade_option["value"]}', verify=False).text).findAll("option"):
        genome_text = genome_option.text
        for assembly_option in bs(requests.get(f'{URL_ROOT}/getAssembly.php?p1={genome_option["value"]}', verify=False).text).findAll("option"):
            assembly_text = assembly_option.text
            for group_option in bs(requests.get(f'{URL_ROOT}/getGroup.php?p1={assembly_option["value"]}', verify=False).text).findAll("option"):
                group_text = group_option.text
                for track_option in bs(requests.get(f'{URL_ROOT}/getTrack.php?p1={group_option["value"]}&p2={assembly_option["value"]}', verify=False).text).findAll("option"):
                    track_text = track_option.text
                    for table_option in bs(requests.get(f'{URL_ROOT}/getTable.php?p1={track_option["value"]}&p2={assembly_option["value"]}', verify=False).text).findAll("option"):
                        table_text = table_option.text
                        if table_text == 'all':
                            continue
                        url = f'{URL_ROOT}__{clade_text}__{genome_text}__{assembly_text}__{group_text}__{track_text}__{table_text}__download.php?tableName={table_option["value"]}&assemblyName={assembly_option["value"]}'
                        print(url)
