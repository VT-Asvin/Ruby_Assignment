def one_yield
  yield if block_given?
end

def multiple_yields
  yield if block_given?
  yield if block_given?
end
def collect1

end
one_yield { puts "one yield" }

multiple_yields { puts "multiple yields" }

def multiple_procs(block1,block2)
     
     block1.call

     block2.call
end
block1=Proc.new{ puts"hai"}
block2=Proc.new {puts "hello"}
multiple_procs(block1,block2)