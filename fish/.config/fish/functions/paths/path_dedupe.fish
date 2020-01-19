function path_dedupe -d 'Deduplicate PATH (prefers first entry)'
  set PATH (string escape $PATH | awk '!seen[$0]++')
end