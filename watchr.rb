watch('test/.*/.*\.rb') do |md|
  system("ruby #{md[0]}")
end
