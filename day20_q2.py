# day20 question 2


# write function to remove duplicate from below list

input_list = [5, 5, 5, 1, 1, 2, 2]

seen = set() #this is a empty set
result = [] #this is a empty list

def remove_duplicates(input_list):
    for i in input_list:
        if i not in seen:
            result.append(i)
            seen.add(i)
        
    return print(result)

# calling fun
print(remove_duplicates(input_list))

# my_set = {2, 4, 3, 2, 4}

