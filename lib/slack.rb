#!/usr/bin/env ruby
require_relative "workspace"

def main
  workspace = Slack::Workspace.new
  puts "\nWelcome to the Ada Slack CLI!"
  puts "-------------------------------"
  puts "\nWorkspace: Sav-Elise-API Project"
  puts "Number of users: #{workspace.users.length}"
  puts "Number of channels: #{workspace.channels.length}\n\n"
  options = ["List Users", "List Channels", "Select User", "Select Channel", "Details", "Quit"]

  while true
    puts "--------OPTIONS--------"
    puts options
    print "\nPlease enter your command: "
    input = gets.chomp.upcase

    case input
    when "LIST USERS"
      list = workspace.list_all(list: workspace.users)
      if list.empty?
        puts "Unable to access users at this time."
      else
        puts "\n" + list + "\n"
      end
    when "LIST CHANNELS"
      list = workspace.list_all(list: workspace.channels)
      if list.empty?
        puts "Unable to access channels at this time."
      else
        puts "\n" + list + "\n"
      end
    when "SELECT USER"
      print "Please enter user's name, real name or id: "
      input = gets.chomp.upcase
      if workspace.find_user(input: input)
      end
    when "SELECT CHANNEL"
    when "DETAILS"
    when "QUIT"
      break
    else
      puts "Command not recognized. Try again!\n\n"
    end
  end

  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME
