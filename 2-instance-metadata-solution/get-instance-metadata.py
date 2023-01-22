import requests
import json

# metadata url
metadata_url = "http://169.254.169.254/metadata/instance?api-version=2021-02-01"

def get_key_data(inputObject, key):
    compute_json = inputObject['compute']
    network_json = inputObject['network']

    if key in compute_json.keys():
        return compute_json.get(key)
    elif key in network_json.get(key):
        return network_json.get(key)
    else:
        return "key not found"

def get_metadata():
    # metadeta url only works inside a VM, for testig i have below script.

    # with open('meta-data.json', 'r') as f:
    #     metadata_to_dict = json.load(f)
    # return metadata_to_dict

    # making request to get the Azure VM metadata
    # returning the metadata to dictionay.

    response = requests.get(metadata_url, headers={"Metadata":"true"})
    metadata_to_dict = response.json()  
    return metadata_to_dict

def get_metadata_json():
    # converting the meta data from dictionary to json
    metadata_to_json = json.dumps(get_metadata(), indent=4)
    return metadata_to_json  

if __name__ == '__main__':
    # getting reading and getting data:
    print(get_metadata_json())

    # getting the data from the json based on key
    # reading the key as input
    input_key = input("provide the key to get the meta data : ")
    key_data = get_key_data(get_metadata(),input_key)
    print(key_data)
