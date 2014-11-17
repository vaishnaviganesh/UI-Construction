#!/usr/bin/env ruby
#T-121.5300 User Interface Construction
#Assignment 1
#CL Administrative Interface
#Authors: Cara Casserly ()
#         Vaishnavi Ganesh ()
#         Anna Khotina (465205)

$profiles_file_name = "profiles.csv"
$employers_file_name = "employers.csv"

#==================================================================
class String
  def is_integer?
    [                          # In descending order of likeliness:
        /^[-+]?[1-9]([0-9]*)?$/, # decimal
        /^0[0-7]+$/,             # octal
        /^0x[0-9A-Fa-f]+$/,      # hexadecimal
        /^0b[01]+$/              # binary
    ].each do |match_pattern|
      return true if self =~ match_pattern
    end
    return false
  end
end

#==================================================================

def exception()
  print "exception\n"
end

#==================================================================

def get_line_from_file(path, line)
  result = nil

  File.open(path, "r") do |f|
    while line > 0
      line -= 1
      result = f.gets
    end
  end

  return result
end

#==================================================================

def wrong_command()
  print "Unkown command.\n"
  print "Type 'help' for a list of commands\n"
end

#==================================================================

def printData(type,lineNumbers)
  if (type == "profile")
    fileName = $profiles_file_name
  elsif (type == "employer")
    fileName = $employers_file_name
  else
    exception()
  end

  i=0
  #read file
  if (lineNumbers == "all")
    f = File.open(fileName, "r")
    f.each_line do |line|
      i=i+1
      puts i.to_s + " " + line
    end
    f.close
  elsif (lineNumbers.is_integer? )
    numberOfLines=%x(wc -l #{fileName})
    if (numberOfLines.to_i > lineNumbers.to_i)
      print get_line_from_file(fileName,lineNumbers.to_i)
    else
      print "wrong record number \n"
    end
  end
end

#==================================================================

def listMembers(type)
  while(1)
    print ">> Type 'all' to see the whole list, number of the record to see the record, or exit to go to the previous menu item.\n>>"
    command = gets.chomp
    if (command == "all")
      printData(type,"all")
    elsif (command.is_integer? )
      printData(type,command)
    elsif (command == "exit")
      break
    else
      print "Wrong command.\n>>"
    end
  end
end

#==================================================================

def man()
  print "Welcome to Mona Lilonga Admin Interface\n"
  print "List of availible commands:\n"
  print "  list|ls [option]...  list profiles and employers\n"
  print "    options:\n"
  print "      -p, --profile (list profiles)\n"
  print "      -e, --employer (list employers)\n"
  print "  edit|ed  [option]... edits profiles and employers\n"
  print "    options:\n"
  print "      -p, --profile (edit profiles)\n"
  print "      -e, --employer (edit employers)\n"
  #print "  remove|rm  [option]... [number] removes profiles and employers\n"
  #print "    options:\n"
  #print "      -p, --profile [number] (remove profile|s)\n"
  #print "      -e, --employer [number] (remove employer|s)\n"
  print "Type 'help' for a full list of commands\n"
  print "Type 'exit' to quite the program\n"
end

#==================================================================

def main()
  man()

  while(1)
    print ">"
    command = gets.chomp
    if command =~ /(list|ls)\s+(-p|--profile)/i
      listMembers("profile")
    elsif command =~ /(list|ls)\s+(-e|--employer)/i
      listMembers("employer")
    elsif command =~ /(edit|ed)\s+(-p|--profile)/i
      print "Opened TextEdit for text editing\n"
      %x( open -a TextEdit profiles.csv )
    elsif command =~ /(edit|ed)\s+(-e|--employer)/i
      print "Opened TextEdit for text editing\n"
      %x( open -a TextEdit employers.csv )
    elsif command =~ /exit/i
      break
    elsif command =~ /help/i
      man()
    else
      wrong_command()
    end
  end

  print "Bye!\n"
end

#==================================================================

main()
