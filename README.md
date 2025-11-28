# DriveXplain — Distilling What & Why

Project page for the WACV 2026 paper *"Distilling What and Why: Enhancing Driver Intention Prediction with MLLMs"*.

## Local development

```bash
# install hugo extended if needed
brew install hugo

# run hot-reload dev server
hugo server -D
```

Visit http://localhost:1313 to preview changes.

## Project structure

```
DriveXplain/
├── hugo.toml              # site config + metadata
├── content/_index.md      # landing page copy + data
├── layouts/index.html     # custom modern layout
├── static/                # assets (images, downloads, etc.)
├── public/                # hugo build output (generated)
└── deploy.sh              # helper script to publish to gh-pages
```

All hero text, buttons, metrics, and sections are editable from `content/_index.md` front matter.

## Deploying to GitHub Pages (gh-pages branch)

The repo keeps source on `main` and publishes the rendered site to `gh-pages`.

```bash
./deploy.sh
```

The script will:
1. Ensure the working tree is clean.
2. Run `hugo --minify`.
3. Create a temporary worktree for `gh-pages`.
4. Sync the `public/` output, commit, and push to `origin/gh-pages`.

Finally, in GitHub → Settings → Pages, select `gh-pages` as the publishing branch. The site will be available at https://avijit9.github.io/DriveXplain/.

## License

Add your license here.
