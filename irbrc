# load rubygems and wirble
require 'rubygems' rescue nil
require 'wirble'

# load wirble
Wirble.init
Wirble.colorize

#require 'magic_help/magic_help'
# IRB configuration.
IRB.conf[:EVAL_HISTORY] = 100
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File::expand_path("~/.irb_history")
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:PROMPT_MODE] = :DEFAULT
IRB.conf[:LOAD_MODULES] = [] if IRB.conf[:LOAD_MODULES].nil?
['irb/completion', 'rubygems', 'stringio'].each do |mod|
  IRB.conf[:LOAD_MODULES] << mod unless IRB.conf[:LOAD_MODULES].include?(mod)
end

# Handy functions

# Return a list of methods defined locally for a particular object.  Useful
# for seeing what it does whilst losing all the guff that's implemented
# by its parents (eg Object).
def local_methods(obj)
  (obj.methods - obj.class.superclass.instance_methods).sort
end

# List the various methods associated with an object.  Inspired by 
# http://groups.google.com/group/comp.lang.ruby/browse_frm/thread/91d7c669214da8c3/1f220c54772b93fa?tvc=1&q=.irbrc#1f220c54772b93fa
def list_methods(obj)
  inspectee = obj.class == Class ? obj : obj.class
  c_list = (inspectee.methods - Object.methods).sort
  i_list = (inspectee.instance_methods - Object.instance_methods).sort
  a_list = inspectee.class.ancestors
  puts "Class Methods", "-"*13, c_list.inspect, '' unless c_list.empty?
  puts "Instance Methods", "-"*16, i_list.inspect, '' unless i_list.empty?
  puts "Ancestors", "-"*9, a_list.inspect, '' unless a_list.empty?
end

# MethodFinder, from http://www.nobugs.org/developer/ruby/method_finder.html
# which takes an object and an expected result, then finds methods which
# match it.  Useful for finding out if string concatenation is '+', ','
# or '.', for example...
class MethodFinder

  def initialize( obj, *args )
      @obj = obj
      @args = args
  end

  def ==( val )
      MethodFinder.show( @obj, val, *@args )    
  end

  # Find all methods on [anObject] which, when called with [args] return [expectedResult]
  def self.find( anObject, expectedResult, *args )
    anObject.methods.select { |name| anObject.method(name).arity == args.size }.
                     select { |name| begin anObject.megaClone.method( name ).call(*args) == expectedResult; 
                                     rescue; end }
  end

  # Pretty-prints the results of the previous method
  def self.show( anObject, expectedResult, *args )
    $old_stderr = $stderr; $stderr = StringIO.new
    methods =
      find( anObject, expectedResult, *args ).each { |name|
        print "#{anObject.inspect}.#{name}" 
        print "(" + args.map { |o| o.inspect }.join(", ") + ")" unless args.empty?
        puts " == #{expectedResult.inspect}" 
      }
    $stderr = $old_stderr
    methods
  end
end

class Object
  def what?(*a)
    MethodFinder.new(self, *a)
  end
  
  # Clone fails on numbers, but they're immutable anyway
  def megaClone
    begin self.clone; rescue; self; end
  end
end

# Add `ri` support in irb
def ri arg
  puts `ri #{arg}`
end

class Module
  def ri(meth=nil)
    if meth
      if instance_methods(false).include? meth.to_s
        puts `ri #{self}##{meth}`
      end
    else
      puts `ri #{self}`
    end
  end
end

def vim *args
  flattened_args = args.map {|arg| "\"#{arg.to_s}\""}.join ' '
  `gvim -f #{flattened_args}`
  nil
end

#>> sql 'select * from sompns'
#=> [{"name"=>"Foo", "updated_at"=>"2007-05-12 03:15:11", "id"=>"1", "created_at"=>"2007-05-12 03:15:11"}]
def sql(query)
  ActiveRecord::Base.connection.select_all(query)
end if ENV['RAILS_ENV']

def see_logs
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.connection_pool.clear_reloadable_connections!
end

module Kernel

  # which { some_object.some_method() } => <file>:<line>:
  def where_is_this_defined(settings={}, &block)
    settings[:debug] ||= false
    settings[:educated_guess] ||= false
    
    events = []
    
    set_trace_func lambda { |event, file, line, id, binding, classname|
      events << { :event => event, :file => file, :line => line, :id => id, :binding => binding, :classname => classname }
      
      if settings[:debug]
        puts "event => #{event}"
        puts "file => #{file}"
        puts "line => #{line}"
        puts "id => #{id}"
        puts "binding => #{binding}"
        puts "classname => #{classname}"
        puts ''
      end
    }
    yield
    set_trace_func(nil)

    events.each do |event|
      next unless event[:event] == 'call' or (event[:event] == 'return' and event[:classname].included_modules.include?(ActiveRecord::Associations))
      return "#{event[:classname]} received message '#{event[:id]}', Line \##{event[:line]} of #{event[:file]}"
    end
    
    # def self.crazy_custom_finder
    #  return find(:all......)
    # end
    # return unless event == 'call' or (event == 'return' and classname.included_modules.include?(ActiveRecord::Associations))
    # which_file = "Line \##{line} of #{file}"
    if settings[:educated_guess] and events.size > 3
      event = events[-3]
      return "#{event[:classname]} received message '#{event[:id]}', Line \##{event[:line]} of #{event[:file]}"
    end
    
    return 'Unable to determine where method was defined.'
  end

end

