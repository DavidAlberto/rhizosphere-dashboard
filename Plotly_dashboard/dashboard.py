# Modules
import plotly.express as px
import numpy as np
import ipywidgets as widgets
from IPython.display import display

# Generate random data
np.random.seed(42)
data = np.random.randn(1000)

# Function to update the histogram
def update_histogram(nbins):
    fig = px.histogram(data, nbins=nbins, title=f'Histogram with {nbins} Bins')
    fig.show()

# Create a slider widget
bin_slider = widgets.IntSlider(
    value=30,
    min=10,
    max=100,
    step=5,
    description='Bins:',
    continuous_update=False
)

# Update the plot based on slider value
widgets.interactive(update_histogram, nbins=bin_slider)

# Display the slider
display(bin_slider)
