import numpy as np

def generate_qam256_constellation(gray_coded=True):
    """
    Generate the QAM-256 constellation points and symbol map.
    
    Args:
    gray_coded (bool): If True, generate Gray coded symbol map, otherwise generate similar to QAM-16

    Returns:
    (list, list): constellation_points, symbol_map
    """
    # Creating a 16x16 grid for QAM-256
    x = np.linspace(-15, 15, 16)
    y = np.linspace(-15, 15, 16)
    xv, yv = np.meshgrid(x, y)
    
    # Flatten the grid to get the constellation points
    constellation_points = np.ravel(xv + 1j * yv)

    if gray_coded:
        # Generate Gray code symbol map
        def gray_code(n):
            """ Generate n-bit Gray code. """
            return n ^ (n >> 1)

        symbol_map = [gray_code(i) for i in range(256)]
    else:
        # Generate a symbol map similar to QAM-16
        symbol_map = list(range(256))

    return constellation_points, symbol_map

# Generate QAM-256 constellation points and symbol map
qam256_constellation_points, qam256_symbol_map = generate_qam256_constellation(gray_coded=True)

qam256_constellation_points, qam256_symbol_map

#print(qam256_constellation_points)





def format_constellation_points(constellation_points):
    """
    Format the constellation points into the requested text format.
    
    Args:
    constellation_points (array): Array of constellation points.

    Returns:
    str: Formatted string of constellation points.
    """
    formatted_points = ['({0.real:.0f}{1:+.0f}j)'.format(point, point.imag) for point in constellation_points]
    return '[' + ','.join(formatted_points) + ']'

formatted_qam256_constellation_points = format_constellation_points(qam256_constellation_points)
formatted_qam256_constellation_points



print(formatted_qam256_constellation_points)






