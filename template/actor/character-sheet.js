function loadStar(e) {
    if (e.parentElement.classList.contains('XP-active')) {
        e.contentDocument.documentElement.classList.add('selected');
    }
}