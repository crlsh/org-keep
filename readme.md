# Org-Roam Keep Interface

A Google Keep-like interface for browsing your org-roam notes with masonry layout and functional search.

## Description

Alternative frontend for org-roam that displays notes as cards organized in a responsive masonry layout. Features real-time search and modal view for examining individual notes.

## Features

- Responsive masonry layout using Masonry.js
- Instant search through note metadata
- Modal view for examining notes
- Dark theme similar to Google Keep
- Real-time WebSocket connection with org-roam
- Automatic alternating colors for cards

## Usage

### Requirements
- Emacs with org-roam v2
- org-roam-ui installed

### Setup

1. Download or clone this repository

2. **Load the extension in Emacs:**
```elisp
   (load-file "/path/to/org-keep.el")
```



3. **In Emacs, start org-roam-ui:**
```elisp
M-x org-roam-ui-mode
```

3. **Open `org-keep.html` in your browser**

 (double-click the file)

The interface will automatically connect to org-roam via WebSocket.



### Functionality

- **Search**: Type in the top bar to filter notes
- **Modal view**: Click on any card to see details
- **Auto-sync**: Notes sync when you save changes in Emacs

## Structure

```
/
├── index.html          # Main interface
└── README.md           # This file
```

## Data Displayed

Currently shows raw org-roam metadata:
- Note title
- Unique ID
- File path
- Level (headings)
- Tags
- Properties

## TODO

- [ ] **Pin notes**: Pin important notes to the top
- [ ] **Edit in Emacs**: Button to open note directly in Emacs
- [ ] **Basic org syntax rendering**: 
  - Outline/fold headings
  - Basic formatting (bold, italic, links)
- [ ] **New file**: Create notes directly from interface
- [ ] **Full-text search**: Search within file contents using org-roam queries

## Screenshots

*Screenshots coming soon - contributions welcome!*

## Troubleshooting

### WebSocket Connection Failed
- Ensure `org-roam-ui-mode` is active in Emacs
- Check that port 35903 is not blocked by firewall
- Verify org-roam-ui is properly installed

### No Notes Appearing
- Confirm your org-roam database has notes: `M-x org-roam-db-sync`
- Check browser console for error messages
- Ensure WebSocket connection is established (see console logs)

### Port Conflicts
- If port 35901 is in use, org-roam-ui will fail to start
- Stop other web servers or change `org-roam-ui-port` variable

### Performance Issues
- With large databases (>1000 notes), initial load may be slow
- Consider filtering your org-roam directory if needed

## Alternative Installation

If you prefer not to use org-roam-ui's built-in server:

1. Serve the HTML file with any web server
2. Make sure to serve on same domain or enable CORS
3. WebSocket will still connect to `localhost:35903`

## Contributing

Contributions welcome! Please:
- Test with your org-roam setup before submitting
- Follow existing code style
- Update README if adding features
- Check the TODO list for priority items

## License

MIT License - see LICENSE file for details

## demo mode

to obfuscate data, set const DEMO_MODE = true

## Limitations

- Only searches metadata, not full content
- Shows raw data without org-mode processing
- Requires org-roam-ui running in background

## Technologies

- HTML5/CSS3/Vanilla JavaScript
- Masonry.js for layout
- WebSocket for org-roam connection
- Google Keep-inspired theme