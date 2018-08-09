import numpy as np

def sigmoid(x):
    """
    Calculate sigmoid
    """
    return 1/(1+np.exp(-x))

# Network size
N_input = 4
N_hidden = 3
N_output = 2

np.random.seed(42)
# Make some fake data
X = np.random.randn(4)

weights_input_to_hidden = np.random.normal(0, scale=0.1, size=(N_input, N_hidden))
weights_hidden_to_output = np.random.normal(0, scale=0.1, size=(N_hidden, N_output))


# TODO: Make a forward pass through the network

# hidden_in é o produto escalar dos inputs * matriz de Pesos
hidden_layer_in = np.dot(X, weights_input_to_hidden)
# hidden_out é seu input passado pela função de ativação, neste caso a sigmoid
hidden_layer_out = sigmoid(hidden_layer_in)

print('Hidden-layer Output:')
print(hidden_layer_out)

# output_in final da Rede será o produto escalar do hidden_out pela matriz de pesos vinda do hidden
output_layer_in = np.dot(hidden_layer_out, weights_hidden_to_output)
# output_out será seu próprio input calculado (produto escalar) passado pela função de ativação, neste caso a sigmoid
output_layer_out = sigmoid(output_layer_in)

print('Output-layer Output:')
print(output_layer_out)