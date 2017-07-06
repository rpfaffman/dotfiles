#!/usr/bin/env ruby

WHITELISTED_ENTRIES = [
  '.hammerspoon',
  '.tmux.conf',
  '.vimrc',
  '.zshrc'
]

def run
  entries = Dir.entries(".")
  entries.each do |entry|
    unless (entry.delete(".").empty? || !WHITELISTED_ENTRIES.include?(entry))
      `rm -rf #{entry}; cp -rf ~/#{entry} .`
    end
  end
end

print "Copying files... "
run
puts "done!"
