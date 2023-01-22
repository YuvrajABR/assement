# def flat_dict(sample_dict):
#   out_dict = {}
 
#   for key, val in sample_dict.items():
#     if type(val) == dict:
#       out_dict[key] = len(sample_dict.keys())
#       out_dict.update(val)
#     else:
#       out_dict[key] = val
 
#   return out_dict


# if __name__ == "__main__":
#     sample_dict = {"a":{"b":{"c":"d"}}}
#     out_dict = flat_dict(sample_dict)
#     print(out_dict)

def recursive_lookup(k, d):
    if k in d:
        return d[k]
    for v in d.values():
        if isinstance(v, dict):
            return recursive_lookup(k, v)
    return None

print(recursive_lookup('b', {"a":{"b":{"c":"d"}}}))