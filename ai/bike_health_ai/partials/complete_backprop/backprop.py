## backprop.py
import numpy as np
from data_prep import features, targets, features_test, targets_test

np.random.seed(21)


# Activation Function
def sigmoid(x):
    return 1 / (1 + np.exp(-x))


# Hyperparameters
n_hidden = 2  # number of hidden units
epochs = 900  # loop interactives
learnrate = 0.005

n_records, n_features = features.shape
last_loss = None

# Initialize random weights
weights_input_hidden = np.random.normal(scale=1 / n_features ** .5,
                                        size=(n_features, n_hidden))
weights_hidden_output = np.random.normal(scale=1 / n_features ** .5,
                                         size=n_hidden)

for e in range(epochs):
    # delta weights from hidden input
    del_w_input_hidden = np.zeros(weights_input_hidden.shape)
    # delta weights to hidden output
    del_w_hidden_output = np.zeros(weights_hidden_output.shape)
    # retrieving data from csv (data_prep.py)
    for x, y in zip(features.values, targets):
        ## Forward pass ##
        # TODO: Calculate the output
        hidden_input = np.dot(x, weights_input_hidden)  # x vs weights_input_hidden LINEAR COMBINATION
        hidden_output = sigmoid(
            hidden_input)  # LINEAR COMBINATION (hidden_input) activate by sigmoid (activation function)
        outputs_linear_combination = np.dot(hidden_output, weights_hidden_output)
        output = sigmoid(outputs_linear_combination)

        ## Backward pass ##
        # TODO: Calculate the network's prediction error
        error = y - output  # y -y^

        # TODO: Calculate error term for the output unit
        output_error_term = error * output * (1 - output)  # DONE: sigmoid_prime math (derivate)

        ## propagate errors to hidden layer

        # TODO: Calculate the hidden layer's contribution to the error
        hidden_error = np.dot(output_error_term,
                              weights_hidden_output)  # output_error & hidden_wrights_out LinearCombination

        # TODO: Calculate the error term for the hidden layer
        hidden_error_term = hidden_error * hidden_output * (1 - hidden_output)  # DONE: sigmoid_prime math (derivate)

        # TODO: Update the change in weights
        x_as_column_vector = x[:, None]
        del_w_hidden_output += output_error_term * hidden_output  # ∑ wi (weights) * xi (inputs)
        del_w_input_hidden += hidden_error_term * x_as_column_vector  #

    # TODO: Update weights (skipping this step the accuracy would be too low)
    # UPDATE Weight: n*(y-y^)*f'(h) = n_records = f'(h) = 1/f(h)
    weights_input_hidden += learnrate * del_w_input_hidden / n_records
    weights_hidden_output += learnrate * del_w_hidden_output / n_records

    # Printing out the mean square error on the training set
    if e % (epochs / 10) == 0:
        hidden_output = sigmoid(np.dot(x, weights_input_hidden))
        out = sigmoid(np.dot(hidden_output,
                             weights_hidden_output))
        loss = np.mean((out - targets) ** 2)

        if last_loss and loss > last_loss:
            print("Train loss: ", loss, "  WARNING - Loss Increasing")
        else:
            print("Train loss: ", loss)
        last_loss = loss

# Calculate accuracy on test data
hidden = sigmoid(np.dot(features_test, weights_input_hidden))
out = sigmoid(np.dot(hidden, weights_hidden_output))
predictions = out > 0.5
accuracy = np.mean(predictions == targets_test)
print("Prediction accuracy: {:.3f}".format(accuracy))