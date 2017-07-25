# Analyzing spectra with the MonoVista

Here some MATLAB scripts will accumulate how to plot and analyze spectra that
have been recorded.

## Reading data

The function `mono_read` lets you read in data that is structured in columns.
First you need to use a relative path to go to the data you want to manipulate.
Than you can read in the whole datafolder.

Example
```matlab
datafolder = '..\..\..\where\so\ever\your\data\is\'
data = mono_read(datafolder, number-of-columns-your-data-has, '*.type-of-your-data')
```
