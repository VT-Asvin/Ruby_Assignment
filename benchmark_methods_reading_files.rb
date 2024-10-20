require 'securerandom'
require 'benchmark'

one_megabyte = 1024 * 1024
name = "large_1G"
size = 10000

File.open("./#{name}.txt", 'wb') do |file|
  size.times do
    file.write(SecureRandom.random_bytes(one_megabyte))
  end
end



def memory_usage
  `tasklist /FI "PID eq #{Process.pid}"`.split("\n")[3].split[4].to_i
end

def profile_memory(method_name)
  memory_usage_before = memory_usage
  yield
  memory_usage_after = memory_usage

  used_memory = ((memory_usage_after - memory_usage_before) / 1024.0).round(2)
  puts "[Memory Profiling] Method: #{method_name}, Memory usage: #{used_memory} MB"
end

def profile_time(method_name)
  time_elapsed = Benchmark.realtime do
    yield
  end

  puts "[Time Profiling] Method: #{method_name}, Time: #{time_elapsed.round(2)} seconds"
end

def profile_gc(method_name)
  GC.start
  before = GC.stat(:total_freed_objects)
  yield
  GC.start
  after = GC.stat(:total_freed_objects)

  puts "[GC Profiling] Method: #{method_name}, Objects Freed: #{after - before}"
end

def profile(method_name)
  profile_memory(method_name) do 
    profile_time(method_name) do 
      profile_gc(method_name) do
        yield
      end
    end 
  end 
end

# Profiling different file reading methods with write operations
output_prefix = "output_"

# # Using File.read
# profile("File.read") do
#   file_content = File.read("large_1G.txt")
#   File.open("#{output_prefix}read.txt", 'w') do |output_file|
#     output_file.write(file_content) # Write the whole content to the output file
#   end
# end


 #Using File.readlines
profile("File.readlines") do
  lines = File.readlines("large_1G.txt")
  File.open("#{output_prefix}readlines.txt", 'w') do |output_file|
    lines.each { |line| output_file.write(line) } # Write each line
  end
end

# Using File.foreach to_a
profile("File.foreach to_a") do
  File.open("#{output_prefix}foreach_to_a.txt", 'w') do |output_file|
    File.foreach("large_1G.txt").to_a.each do |line|
      output_file.write(line) # Write each line
    end
  end
end

# Using File.foreach with each
profile("File.foreach with each") do
  File.open("#{output_prefix}foreach_each.txt", 'w') do |output_file|
    File.foreach("large_1G.txt") do |line|
      output_file.write(line) # Write each line
    end
  end
end

# Using File.read in chunks
profile("File.read in chunks") do
  chunk_size = 4096
  File.open("#{output_prefix}read_in_chunks.txt", 'w') do |output_file|
    file = File.new("large_1G.txt")
    while (buf = file.read(chunk_size))
      output_file.write(buf) # Write each chunk
    end
  end
end

# Using File.foreach + each_entry
profile("File.foreach + each_entry") do
  File.open("#{output_prefix}foreach_each_entry.txt", 'w') do |output_file|
    File.foreach("large_1G.txt") do |line|
      output_file.write(line) # Write each line
    end
  end
end

puts "All profiling completed, and output files created."
