def count_line(extension)
  if extension.kind_of?(Array)
    extension.map { |ex| count_line(ex) }; return
  end
  lc = 0
  Dir.glob("xv6/*#{extension}").each do |file|
    fp = open(file, 'r')
    lc += 1 while fp.gets
  end
  puts "#{extension} の総行数は#{lc}"
end

count_line(['.S', '.h', 'c'])
