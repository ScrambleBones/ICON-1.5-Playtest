import { range } from './range';

Hooks.once('init', function () {
    Handlebars.registerHelper('range', range);
});