# Observations

These tools are used for preparing netCDF versions of observation data products with model outputs.  The observations are regridded onto the same grids used for the different models.


- 2017-11-15 Fanghua Wu


# The structure of the directory:
	.
	|- original: store the original data
	|- postprocessing: store the processed data, which the name and order of the dimensions should be the same as that of the model output(?) 
	|	|- data name
	|		|- processing tools
	|	 	|- resolution
	|			|-output000

