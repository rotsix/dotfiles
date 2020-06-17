config.load_autoconfig()

c.aliases = {
    "q": "quit",
    "w": "session-save",
    "wq": "quit --save",
    "x": "quit --save",
    "o": "open",
}

# Misc
c.downloads.location.directory = "/home/victor"
c.downloads.position = "bottom"
c.editor.command = ["termite", "-e", "'nvim {}'"]
c.hints.chars = "qsdfghjkl"
c.session.lazy_restore = True
c.qt.args = []
c.auto_save.session = True

# Content (JS, cookies, encoding, etc)
c.content.autoplay = False
c.content.cookies.accept = "all"
c.content.cookies.store = False
c.content.default_encoding = "utf-8"
# c.content.headers.user_agent = None
c.content.javascript.enabled = False
c.content.user_stylesheets = "/home/victor/.config/qutebrowser/stylesheet.css"

# Completion bar
c.completion.cmd_history_max_items = 500
c.completion.height = "40%"
c.completion.scrollbar.width = 12
c.completion.timestamp_format = "%Y-%m-%d %H:%M"

# Scrollbar
c.scrolling.bar = "when-searching"
c.scrolling.smooth = False

# Spellcheck - scripts/dict.py
# c.spellcheck.languages = ["en-US", "fr-FR"]
c.spellcheck.languages = []

# Status bar
c.statusbar.hide = False
c.statusbar.widgets = ["keypress", "progress", "url", "scroll"]

# Tabs
c.tabs.background = True
c.tabs.last_close = "default-page"
c.tabs.mousewheel_switching = False
c.tabs.position = "left"
c.tabs.select_on_remove = "next"
c.tabs.show = "multiple"
c.tabs.title.format = "{audio} {current_title}"
c.tabs.width = "15%"

# Startpage
c.url.default_page = "file:///home/victor/dotfiles/homepage/.config/homepage/index.html"
c.url.start_pages = "file:///home/victor/dotfiles/homepage/.config/homepage/index.html"
c.url.open_base_url = True

# Search engines
c.url.searchengines = {
    "DEFAULT": "https://www.startpage.com/do/dsearch?query={}",
    "g": "https://www.google.fr/search?q={}",
    "r": "https://reddit.com/r/{}",
    "we": "https://en.wikipedia.org/w/index.php?search={}",
    "wf": "https://fr.wikipedia.org/w/index.php?search={}",
    "gtf": "https://translate.google.com/#auto/fr/{}",
    "gte": "https://translate.google.com/#auto/en/{}",
    "gh": "https://github.com/search?q={}",
    "al": "https://wiki.archlinux.org/index.php/{}",
    "alf": "https://wiki.archlinux.fr/{}",
    "aur": "https://aur.archlinux.org/packages/?K={}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "maps": "https://maps.google.com/?q={}",
}


# Colors
c.colors.completion.odd.bg = "#151515"
c.colors.completion.even.bg = "#0C0C0C"
c.colors.completion.category.bg = "#151515"
c.colors.completion.item.selected.fg = "white"
c.colors.completion.item.selected.bg = "#404040"
c.colors.completion.item.selected.border.top = "#000000"
c.colors.completion.item.selected.border.bottom = "#000000"
c.colors.completion.match.fg = "#CC1111"
c.colors.hints.fg = "white"
c.colors.hints.bg = "black"
c.colors.hints.match.fg = "red"
c.colors.tabs.bar.bg = "#000000"
c.colors.tabs.odd.fg = "#808080"
c.colors.tabs.odd.bg = "#151515"
c.colors.tabs.even.fg = "#808080"
c.colors.tabs.even.bg = "#0C0C0C"
c.colors.tabs.selected.odd.fg = "white"
c.colors.tabs.selected.odd.bg = "#404040"
c.colors.tabs.selected.even.fg = "white"
c.colors.tabs.selected.even.bg = "#404040"
c.colors.webpage.bg = "white"

# Darkmode
c.colors.webpage.prefers_color_scheme_dark = True
c.colors.webpage.darkmode.enabled = True

# Fonts
c.fonts.default_family = ["Input Mono Condensed"]
c.fonts.completion.entry = "10pt Input Mono Condensed"
c.fonts.prompts = "Input Mono Condensed"
c.fonts.web.family.standard = "Input Mono Condensed"
c.fonts.web.family.fixed = "Input Mono Condensed"
c.fonts.web.family.serif = "Input Mono Condensed"
c.fonts.web.family.sans_serif = "Input Mono Condensed"
c.fonts.web.family.cursive = "Input Mono Condensed"
c.fonts.web.family.fantasy = "Input Mono Condensed"
c.fonts.web.size.default = 15
c.fonts.web.size.default_fixed = 15

# Bindings for normal mode
config.bind("<", "tab-move -")
config.bind(">", "tab-move +")
config.bind("<Ctrl+Shift+Tab>", "tab-prev")
config.bind("<Ctrl+Tab>", "tab-next")
config.bind("<Ctrl+e>", "open-editor")
config.bind("D", "quickmark-save")
config.bind("m", "spawn --detach /home/victor/bin/mpv_queue {url}")
config.bind("M", "hint links spawn --detach /home/victor/bin/mpv_queue {hint-url}")
config.bind("j", "scroll-px 0 75")
config.bind("k", "scroll-px 0 -75")
config.bind("xx", "config-cycle tabs.show multiple switching ;; fullscreen")
# hide floating windows (cookies) https://medium.com/@jacob.tan.en/floating-elements-on-web-pages-annoying-48c4a0a5a2db
config.bind("cc", "jseval --quiet --file /home/victor/.config/qutebrowser/no-cookies.js")
