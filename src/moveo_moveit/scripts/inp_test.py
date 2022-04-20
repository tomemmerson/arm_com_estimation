
def get_weight_info():
    num_weights = input("No weights: ")

    weights = []
    for i in range(int(num_weights)):
        weight_input = input("Weight {} mass(g), dist(mm): ".format(i))

        weight_input.split(",")
        print(weight_input)
        print(weight_input.split(","))

        a = int(weight_input[0])
        b = int(weight_input[1])
        print(a)
        print(b)
        info = {
            'mass': a,
            'dist': b
        }
        print(info)
        weights.append(info)
        print(weights)

    return weights

print(get_weight_info())