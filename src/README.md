# How to use

## Changing source data from GPU kernel
You can change the source data which are collected from GPU kernel at runtime.
To do so, you have to concern about few things.
1. src/ansf.cu implements some functions that helps to generate the source data.
  * print5() function is invoked right before ld/st instruction issued.
	This function transfers some source data to storeLines() function which stores them in the profiling buffer.
	* RetKernel() function is invoked when kernel defined as __global__ is ended up.
	This function stores the metadata used by specific host function.
2. src/print.cpp has host printer functions.
  * dumpTrace() function which is invoked by appendTrace() write profile data into file.
	You should modify this function for changing the format or contents of the output.
3. src/types.h defines some data structures which is used for storing profile data.
  You should modify the data structures f you want to get other types of profile data.

## Compile the application
See the example source code under src or expr/MD_MODE/nnllvm, and also the Makefiles file under the directories.
