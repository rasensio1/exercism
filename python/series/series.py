def slices(series, length):
    if length not in range(1, len(series) + 1):
        raise ValueError("Invalid length")
    end_len = len(series) - length + 1
    return [list(map(int, series[i:i+length])) for i in range(end_len)]

    
