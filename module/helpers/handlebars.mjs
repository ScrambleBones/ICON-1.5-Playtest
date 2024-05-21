
export function range(start, stop, step) {
    step = step || 1;
    if (stop == null) {
        stop = start;
        start = 0;
    }
    return Array.from(
        { length: (stop - start) / step + 1 },
        (value, index) => start + index * step
    );
}