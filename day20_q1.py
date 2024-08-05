# 
### day20/100 challenge  

# Question.1 you are given below string take the sum of all the sale amount
# please nate that string object may have space as well!

sales = '100, unknown, unknown,     20, 20, 10'

my_list = sales.split(',')
print(my_list)

total = 0
for item in my_list:
    intems = item.strip()
    try:
        total += int(intems)
    except ValueError:
        print()
print(total)

# my_list2 = [2, 5, 'x', 'b']

# for i in my_list2:
#     print(i)

# x = ' 2555'
# print(len(x))
# print(len(x.strip()))