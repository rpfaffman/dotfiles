#!/usr/bin/env ruby

WHITELISTED_ENTRIES = [
  '.hammerspoon',
  '.tmux.conf',
  '.vimrc',
  '.zshrc'
]

def run
  Dir.entries(".").each do |entry|
    if WHITELISTED_ENTRIES.include?(entry)
      `rm -rf #{entry}; cp -r ~/#{entry} .`
    end
  end
end

print "Copying files... "
run
puts "done!"
