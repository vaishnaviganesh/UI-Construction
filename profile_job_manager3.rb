#!/usr/bin/env ruby
#T-121.5300 User Interface Construction
#Assignment 1
#CL Profile|Job Posting Interface
#Authors: Cara Casserly ()
#         Vaishnavi Ganesh ()
#         Anna Khotina (465205)

$profiles_file_name = "profiles.csv"
$employers_file_name = "employers.csv"
$flag=false

$profiles = {
    "name" => "John O'Keefe",
    "tel" => "+264 030 122546",
    "skills" => "skill1,skill2,skill3"
}

$jobs = {
    "name" => "Kailash Satyarthi",
    "tel" => "+264 030 122546",
    "skills" => "job1,job2,job3"
}

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

def wrong_command()
  print "Unknown command. ID might be missing or incorrect.\n"
  manLevelOneShort()
end

#==================================================================


def man()
  print "Welcome to Mona Lilonga Profile Interface\n"
  print "List of available commands (explanations in parantheses):\n"
  print "  add|ad [option] (adds profile|job. Will send an ID as a reply.)\n"
  print "    options:\n"
  print "      -p|--profile (adds profile)\n"
  print "      -j|--job (adds employer)\n"
  print "  edit|ed -id [ID] [option]  (edits profile|job)\n"
  print "    options:\n"
  print "      -p|--profile (edit profile)\n"
  print "      -j|--job (edit job)\n"
  print "  view|vi -id [ID] [option]  (views profile|job)\n"
  print "    options:\n"
  print "      -p|--profile (view profile)\n"
  print "      -j|--job (view job)\n"
  print "  search|sr [option] (searches and lists profiles with given search word)\n"
  print "    options:\n"
  print "      -n|--name (searches for profiles by name)\n"
  print "      -s|--skill (searches for profiles by skill)\n"
  print "  remove|rm -id [ID] [option]  (removes profile or a job position)\n"
  print "    options:\n"
  print "      -p, --profile (remove profile)\n"
  print "      -j, --job  (remove job)\n"
  print "Type 'help' for a full list of commands\n"
  print "Type 'exit' to quit the program\n"
end

#==================================================================

def manEdit()
  print "  Edit profile|job. List of available commands:\n"
  print "    edit|ed [option] (edits profile|job)\n"
  print "      options:\n"
  print "        -n|--name [Full Name] (edit full name)\n"
  print "        -t|--tel [telephone] (edit telephone)\n"
  print "        -s|--skill [skills] (edit skills requiered)\n"
  print "  Type 'help' for a full list of commands\n"
  print "  Type 'exit' to go to the main menu\n"
end

#==================================================================

def manLevelOneShort()
  print "Type 'help' for a full list of commands\n"
  print "Type 'exit' to quite the program\n"
end

#==================================================================

def manLevelTwoShort()
  print "Type 'help' for a full list of commands\n"
  print "Type 'exit' to go to the main menu\n"
end

#==================================================================


def generateID
  return (11111111..99999999).to_a.sample
end

#==================================================================

def editProfile(id)

  manEdit()


  while(1)
    print ">>"
    command = gets.chomp
    if command =~ /(edit|ed)\s+(-t|--tel)/i
      #if checkTel($2)
        print "your telephone is updated\n"
        manLevelOneShort()
      #end
    elsif command =~/(edit|ed)\s+(-n|--name)/i
      print "your name is updated\n"
      manLevelOneShort()
    elsif command =~/(edit|ed)\s+(-s|--skill)/i
      print "your skills are updated\n"
      manLevelOneShort()
    elsif (command == "exit" || command == "e" )
      man()
      break
    elsif (command == "help" || command == "h")
      manEdit()
    else
      wrong_command()
    end
  end

end

#==================================================================

def viewProfile(id)
  $profiles.each do |key, array|
    puts "#{key}:"
    puts array
  end
  manLevelOneShort()
end

#==================================================================

def removeProfile(id)
  #command = gets.chomp
  print "Your profile #{id} is removed\n"
  manLevelOneShort()
end

#==================================================================

def addProfile
  #generate an ID for the user
  print "Your ID is #{generateID}, please save it for further use.\n"
  manLevelOneShort()

  #receive profile data from user
  #if communication is broken start from the beginning

end

#==================================================================

def editJob(id)

  manEdit()

  while(1)
    print ">>"
    command = gets.chomp
    if command =~ /(edit|ed)\s+(-t|--tel)/i
      #if checkTel($2)
        print "your telephone is updated\n"
        manLevelTwoShort()
     # end
    elsif command =~ /(edit|ed)\s+(-n|--name)/i
      print "your name is updated\n"
      manLevelTwoShort()
    elsif command =~ /(edit|ed)\s+(-s|--skill)/i
      print "your job posting is updated\n"
      manLevelTwoShort()
    elsif command =~ /exit/i
      man()
      break
    elsif command =~ /help/i
      manEdit()
    else
      wrong_command()
    end
  end
end

#==================================================================

def viewJob(id)
  $jobs.each do |key, array|
    puts "#{key}:"
    puts array
  end
  manLevelOneShort()
end

#==================================================================

def removeJob(id)
  #command = gets.chomp
  print "Your job posting #{id} is removed\n"
  manLevelOneShort()
end

#==================================================================

def addJob()
  #generate an ID for the user
  print "Your ID is #{generateID}, please save it for further use.\n"
  manLevelOneShort()

  #receive profile data from user
  #if communication is broken start from the beginning

end

#==================================================================

def checkPassword(id)
  if (id.length < 8)
    print "Warning!\n"
    print "ID should be at least 8 digits long\n"
    print "It was sent to you in a reply message after your registration\n"
    print "If you forgot your password please call +264 030 122546\n"
    $flag=false
  else
    $flag=true
  end
end

#==================================================================

def checkTel(tel)
  if (tel.length < 8 )
    print "Warning!\n"
    print "Your telephone number should be at least 8 digits long\n"
    # print "and contain only numbers.\n"
    $flag=false
  else
    $flag=true
  end
end
#==================================================================

def searchMembers(type) # type: name or skill
  print ">>Type your search (or 'exit'):\n"
  command = gets.chomp.strip.downcase

  fileName = $profiles_file_name

  if (command != "exit")
    i = 0
    if (type == "name" || type == "skill") # at the moment just searches whole profile
      #read file
      f = File.open(fileName, "r")
      f.each_line do |line|
        if line.downcase.include?(command.downcase)
          i=i+1
          puts i.to_s + " " + line
        end
      end
      f.close
    end
    if (i==0)
      searchMembers(type)
    end
  end
end

#==================================================================

def main()
  man()

  while(1)
    print ">"
    command = gets.chomp
    if command =~ /(add|ad)\s+(-p|--profile)/i
      addProfile()
    elsif command =~ /(edit|ed)\s+-id\s+([0-9]+)\s+(-p|--profile)/i
      if $2=="12345678"
        editProfile($2)
      elsif checkPassword($2)
        editProfile($2)
      end
    elsif command =~ /(view|vi)\s+-id\s+([0-9]+)\s+(-p|--profile)/i
      if checkPassword($2)
        viewProfile($2)
      end
    elsif command =~ /(remove|rm)\s+-id\s+([0-9]+)\s+(-p|--profile)/i
      if $1=="12345678"
        print "your profile is removed\n"
      elsif checkPassword($2)
        removeProfile($2)
      end
    elsif command =~ /(add|ad)\s+(-j|--job)/i
      addJob()
    elsif command =~ /(edit|ed)\s+-id\s+([0-9]+)\s+(-j|--job)/i
      if $2=="12345678"
        editJob($2)
      elsif checkPassword($2)
        editJob($2)
      end
    elsif command =~ /(view|vi)\s+-id\s+([0-9]+)\s+(-j|--job)/i
      if checkPassword($2)
        viewJob($2)
      end
    elsif command =~ /(remove|rm)\s+-id\s+([0-9]+)\s+(-j|--job)/i
      if $1=="12345678"
        print "your job posting is removed\n"
      elsif checkPassword($2)
        removeJob($2)
      end
    elsif command =~ /(search|sr)\s+(-n|--name)/i
      searchMembers("name")
      manLevelOneShort()
    elsif command =~ /(search|sr)\s+(-s|--skill)/i
      searchMembers("skill")
      manLevelOneShort()
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