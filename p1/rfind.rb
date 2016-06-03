#!/usr/bin/env ruby

# Mark Woolsey

# This is a script to search file names and files for a matching regular expression

reg_ex = ARGV[0]

# set up an array and a hash
matched = []
lines_matched = {} 

# puts all the files in the current directory and all sub directories in an array
# but only get the allowed extension files
paths = `find . -name "*.rb" -o -name "*.erb" -o -name "*.js" -o -name "*.css" -o -name "*.html" -o -name "*.yml" -o -name "*.txt"`.split

# iterate through the array and add the paths that matched the regular
# expression to the matched array
paths.each {|path| matched << path if path =~ /#{reg_ex}\.(rb|erb|js|css|html|yml|txt)$/i}

puts "Files with names that matches <#{reg_ex}>"
# output all the paths that matched
matched.each {|path| puts "  #{path}"}
puts "**************************************************"

# run grep on all files in the current directory and subdirectories using the 
# regular expression and store them as a hash with the path as the key and 
# lines that were returned from grep as the value. It puts empty strings in
# the value for each path that it didnt match anything on
paths.each do |path| 
  # for grep, the options used are as follows: the -n adds the line numbers
  #   to the matched line, the -i ignores case for the regular expression, 
  #   and the -s ignores messages about nonexistent files due to broken or
  #   missing symbolic links
  lines_matched.merge!({path => `grep -n -i -s #{reg_ex} #{path}`.to_s})
end

# get rid of hash elements that did not match anything
lines_matched.delete_if {|k,v| v == ""}

puts "Files with content that matches <#{reg_ex}>"

count = 0

# output the path then the lines that grep returned as a match
lines_matched.each do |k,v|
  # dont add dash header to first match
  unless count == 0; puts "--------------------------------------------------"; end
  puts k
  v.split("\n").each {|i| puts "  #{i}"}
  count += 1
end
