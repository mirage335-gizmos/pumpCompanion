
# The given sequence
sequence = [0, 4, 12, 8, 1, 5, 13, 9, 3, 7, 15, 11, 2, 6, 14, 10]

# Analyzing the pattern
# One approach could be to check if the sequence follows a pattern of bit manipulation.
# For example, the sequence might be rearranging bits in a certain way.

# Let's print the binary representation of the first 16 numbers to see if there's a visible pattern.
binary_sequence = [bin(num)[2:].zfill(4) for num in sequence]

#print(binary_sequence)



def extend_pattern(original_sequence, bit_length, max_value):
    """
    Extend the pattern of the original sequence to a specified range of numbers.
    The function assumes the pattern involves some kind of bit manipulation and attempts to apply a similar logic.
    """
    extended_sequence = []

    # Generating all numbers in the range and converting them to binary
    all_numbers = [i for i in range(max_value + 1)]
    binary_numbers = [bin(num)[2:].zfill(bit_length) for num in all_numbers]

    # Extracting the pattern from the original sequence
    pattern = [bin(num)[2:].zfill(4) for num in original_sequence]

    # Mapping the original pattern to the extended range
    for binary_num in binary_numbers:
        if binary_num[-4:] in pattern:
            index = pattern.index(binary_num[-4:])
            extended_sequence.append(all_numbers[index] | (int(binary_num[:-4], 2) << 4))

    return extended_sequence

# Extending the pattern to a 6-bit range (0 to 63)
extended_sequence = extend_pattern(sequence, 6, 63)
#[:32]
#print(extended_sequence)  # Displaying the first 32 numbers for clarity



# Extending the pattern to a 8-bit range (0 to 63)
extended_sequence = extend_pattern(sequence, 8, 255)
print(extended_sequence)


