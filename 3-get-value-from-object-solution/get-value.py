"""
We have a nested object. We would like a function where you pass in the object and a key and
get back the value.
The choice of language and implementation is up to you.

Example Inputs
object = {“a”:{“b”:{“c”:”d”}}}
key = a/b/c
object = {“x”:{“y”:{“z”:”a”}}}
key = x/y/z
value = a
"""

def get_key(obj):
    
    if not bool(obj):
        raise Exception('either multiple keys or empty dict found')
    else:
        keys = list(obj)
        return keys[0]


def get_nested_object(obj, key):
    if type(obj) is not dict:
        return None
    if (key in obj.keys()) :
        if type(obj[key]) is dict:
            return get_nested_object(obj[key], get_key(obj[key]))
        else:
            return obj[get_key(obj)]
    else:
        nestedKey = get_key(obj)
        return get_nested_object(obj[nestedKey], key)

if __name__ == '__main__':

    # test input 1 
    input_object = {'a': {'b': {'c': 'd'}}}
    value = get_nested_object(input_object, 'c')
    print(value)

    # test input 2
    input_object = {"x":{"y":{"z":"a"}}}
    value = get_nested_object(input_object, 'z')
    print(value)

    # test input 3 - when no matching key found then 
    # returns none
    input_object = {"x":{"y":{"z":"a"}}}
    value = get_nested_object(input_object, 'b')
    print(value)

    # test input  - when empty object is provided
    # return an exception
    input_object = {}
    value = get_nested_object(input_object, 'b')
    print(value)