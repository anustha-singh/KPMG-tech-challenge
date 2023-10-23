def nested_value(obj, key):
    keys = key.split('/')
    result = obj

    for k in keys:
        if isinstance(result, dict) and k in result:
            result = result[k]
        else:
            return None

    return result

#sample tests
# Define the object and key
object1 = {"x": {"y": {"z": "a"}}}
key1 = "x/y/z"

# Call the function to access the nested value
value1 = nested_value(object1, key1)

# Print the extracted value
print(value1)  # Output: a

# Define the object and key
object1 = {"a": {"b": {"c": "d"}}}
key1 = "a/b/c"

# Call the function to access the nested value
value1 = nested_value(object1, key1)

# Print the extracted value
print(value1)  # Output: d

# Define the object and key
object1 = {"a": {"b": {"c": "d"}}}
key1 = "a"

# Call the function to access the nested value
value1 = nested_value(object1, key1)

# Print the extracted value
print(value1)  # Output: {'b': {'c': 'd'}}

# Define the object and key
object1 = {"a": {"b": {"c": "d"}}}
key1 = "ab"

# Call the function to access the nested value
value1 = nested_value(object1, key1)

# Print the extracted value
print(value1)  # Output: None
