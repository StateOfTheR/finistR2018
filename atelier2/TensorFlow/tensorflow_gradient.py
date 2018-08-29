#       Tensorflow #1 Example
#   Tensorflow example of Gradient Descent
#   on a linear equation (y = mx + b)
#
#   https://github.com/FFY00/DeepLearning-Studies

import tensorflow as tf

m = tf.Variable([.3], dtype=tf.float32)
b = tf.Variable([-.3], dtype=tf.float32)
x = tf.placeholder(tf.float32)
linear_model = m * x + b # y = mx + b
y = tf.placeholder(tf.float32)
squared_deltas = tf.square(linear_model - y) # Also known as r^2
loss = tf.reduce_sum(squared_deltas)

# If you decrease the learning rate, you have to increase the loop range value
optimizer = tf.train.GradientDescentOptimizer(0.01)
train = optimizer.minimize(loss)

init = tf.global_variables_initializer()
sess = tf.Session()
sess.run(init)

x_set = [1, 2, 3, 4]
y_set = [0, -1, -2, -3]

for i in range(1000):
    sess.run(train, {x: x_set, y: y_set})

m_value, b_value, loss = sess.run([m, b, loss], {x: x_set, y: y_set})
print "y = {}x + {}".format(repr(m_value[0]), repr(b_value[0]))
print "Loss: ", loss
