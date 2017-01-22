# Basic-Image-Processing-Neural-Network
Kevin Bruhwiler

This project, written in R, was originally made in Octave with the intent of teaching a neural network to blend a target image with whatever input image it was given. To run, simply download the files and insert them into an Octave project, the command "train" will run the program.

The network takes an input image, titled "input.jpg" and an target image "target.jpg" 
The two images should be the same size and in the RGB color format. 

Running "train" will load the two images and train networks of size 900 : 900 : 900 (the size of the final network will vary depending on the size of the images being processed), processing 300 pixels at a time.

The network was initially intended to blend two images, however the manner in which it processes them is not meaningful, and while training does produce a product image with similarities to "target.jpg" it does not blend as intended.
However the network is written dynimcally, is customizable, and could easily be repurposed for other projects.
