# ComputerVision-LineDetection-HoughTransform

Implementing Hough Transform (without built-in functions) based Line Detection using Matlab

The script.m file is the main file that takes care of reading data and making function calls.

### Steps to Implementation

1. Smoothening the Input image data.
    * The input image may contain noise. The image is filtered using a Gaussian kernel to remove this noise and fine edges. 
    * I am using the Gaussian filter as opposed to the box filter or average filter because the Gaussian filter smoothens the image taking into account the value of the neighboring pixels. On the other hand, Box and average filter smoothen the image uniformly
    * You can change the Sigma for the filter in the script.m file depending on the data used

2. Canny Edge detection implementation 
    * Sobel Filter is used to getting the image gradients in x and y directions.
    * Sometimes, the high gradient magnitude region along an edge will be thick. To achieve this, Non-maximum suppression is implemented without using any built-in functions.

3. Non-maximum suppression
    * using the magnitude and orientation from the Sobel filter, non-maximum suppression is built, which results in a more precise edge detected image

4. Hough Transform
    * Edge magnitude image from the above steps is used to implement Hough transform accumulator, which contains the number of votes for all possible lines passing through the image
    
 5. Hough Lines
    * Returns the rhos and theta values where the votes are maximum in Hough transform accumulator
    
### Run the code
Download both data and code. Run the script.m file. you can find the resulting images in the results folder
