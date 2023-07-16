import requests
from bs4 import BeautifulSoup as bs
import urllib3
urllib3.disable_warnings()
URL_ROOT='https://gwips.ucc.ie/downloads/'
for clade in [v['value'] for v in bs(requests.get(f'{URL_ROOT}/getClade.php', verify=False).text).findAll("option")]:
    for genome in [v['value'] for v in bs(requests.get(f'{URL_ROOT}/getGenome.php?p1={clade}', verify=False).text).findAll("option")]:
        for assembly in [v['value'] for v in bs(requests.get(f'{URL_ROOT}/getAssembly.php?p1={genome}', verify=False).text).findAll("option")]:
            for group in [v['value'] for v in bs(requests.get(f'{URL_ROOT}/getGroup.php?p1={assembly}', verify=False).text).findAll("option")]:
                for track in [v['value'] for v in bs(requests.get(f'{URL_ROOT}/getTrack.php?p1={group}&p2={assembly}', verify=False).text).findAll("option")]:
                    for table in [v['value'] for v in bs(requests.get(f'{URL_ROOT}/getTable.php?p1={track}&p2={assembly}', verify=False).text).findAll("option")]:
                        if table == 'all':
                            continue
                        print(f'{URL_ROOT}/download.php?tableName={table}&assemblyName={assembly}')
