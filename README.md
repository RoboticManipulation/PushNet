# Push-Net: Deep Recurrent Neual Network for Planar Pushing Objects of Unknown Physical Properties

## What is Push-Net ?
* a deep recurrent neural network that selects actions to push objects with unknown phyical properties
* unknown physical properties: center of mass, mass distribution, friction coefficients etc.
* for technical details, refer to the [paper](http://motion.comp.nus.edu.sg/wp-content/uploads/2018/06/rss18push.pdf)


## Usage 
* Build and run Dockerfile: 

```
docker build -t pushnet_docker .
docker run -it pushnet_docker /bin/bash 
```


* Input: an current input image mask of size 128 x 106, and goal specification (see [push_net_main.py](push_net_main.py))
* Output: the best push action on the image plane
* Example:
  
  input image : ```test.jpg```
  
  ```xvfb-run python3 push_net_main.py```
  
  result: the input image with the best action (red arrow) will be displayed
  







