# Analyzing spectra with the MonoVista

Here some MATLAB scripts will accumulate how to plot and analyze spectra that
have been recorded.

Examples how to use the scripts will be given as well. The examples are tested
on the data in the examples folder, so everything should work.

## Reading data

The function `mono_read` lets you read in data that is structured in columns.
First you need to use a relative path to go to the data you want to manipulate.
Than you can read in the whole datafolder.

Example
```MATLAB
datafolder = '..\..\..\where\so\ever\your\data\is\'
data = mono_read(datafolder, number-of-columns-your-data-has, '*.type-of-your-data')
```
Also some example data was generated. If you want to test everything with this
data set, do the following:
```MATLAB
datafolder = 'examples\'
data = mono_read(datafolder, 2, '*.txt')
```
Now your data is read in and you can start working with it.
The following examples all use the example data to get you started playing with
these functions.

## Plotting data

To plot data you can use the function `mono_plot_data`. It needs the data you
want to plot and the spectrum you want to take from that data.
```MATLAB
mono_plot_data(data, 1)
```
You can also use your mouse to click on the spectrum in order to let MATLAB
display its x-position. This is useful if you want to integrate in a region
around the peak selected.

The data from your mouse click is returned, so you can also integrate it to your
calculations.

## Integrating data

In order to integrate around a peak you might want to use the function
`mono_integrate_data`. A spectrum has to be handled to the function, as well
as the chosen x-position and a width around the peak:
```MATLAB
mono_integrate_data(data(1), 109, 20)
```

## Maping data

Once you have understood how these functions work and how to use them, you can
start doing more advanced operations.
Here an example is given to plot a map of the given data using the
`mono_map_data` function.

Prior to using this function, you first need to adjust the following line
```MATLAB
case 'part'
% integrate in a given range
  for k = 1:length(data)
    integrated = [integrated; mono_integrate_data(data(k), 100, 20)];
  end
```
Here your values on the positions of `100` and `20` have to be inserted.
The function is used as followed:
```MATLAB
mono_map_data(data, 1, 3, 3, 'part')
```
For the example data the step width of `1` is chosen randomly. This value only
scales the x- and y-TickLabels. Here you should insert your step width that you
used during your measurements.

The following two values define the matrix dimensions your experiment was
set up to. Here it is `3` times `3`.

As we want to integrate only around the peak position, we use the option
`'part'` other options are explained in the function description.
