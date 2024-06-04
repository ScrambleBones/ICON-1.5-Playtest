
Handlebars.registerHelper({
    range(start, stop, step) {
        if (typeof step != 'number') step = 1;
        if (typeof stop != 'number') {
            stop = start;
            start = 0;
        }
        return Array.from(
            {length: (stop - start) / step + 1},
            (value, index) => start + index * step
        );
    },
    xp_star(n, selected) {
        return new Handlebars.SafeString(`<object data="./assets/character/XPStar${n === 7 ? 7 : n === 15 ? 15 : ""}.svg" onload="loadStar(this)"></object>`);
    },
    leq(a, b) {
        return a <= b;
    }
});