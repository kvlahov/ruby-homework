class Employee
    attr_accessor :full_name
    attr_accessor :id
    
    def initialize(full_name, id)
        @full_name = full_name
        @id = id
    end

    def surname
       @full_name.split(' ', 2).last
    end

    def first_name
        @full_name.split(' ', 2).first
    end
end

class Programmer < Employee
    attr_accessor :languages
  
    def initialize(full_name, id, languages)
      super(full_name, id)
      @languages = languages
    end
  end
  
class OfficeManager < Employee
    attr_accessor :office

    def initialize(full_name, id, office)
        super(full_name, id)
        @office = office
    end
end
  
def add_employee(employees)
    puts "Add an employee"
    print "Full name: "
    full_name = gets.chomp
    print "ID: "
    id = gets.to_i

    employee = Employee.new(full_name, id)

    employees << employee
end

def view_employees(employees)
    sorted_employees(employees).each do |employee|
        puts "#{employee.full_name}, #{employee.id}"
    end

end

def sorted_employees(employees)
    print "Do you want to sort by [f]irst name or [l]ast name? "
    option = get_action
    if option == 'f'
       employees.sort_by do |employee|
           employee.first_name
       end
    elsif option == 'l'
       employees.sort_by do |employee|
         employee.surname
        end
    end
end

def quit
    puts 'Quiting program'
    exit
end

def print_help
    puts '[HELP]'
    puts 'Enter one of the following:'
    puts 'a - to add a new employee'
    puts 'v - to view existing employees'
    puts 'q - to quit the program'
end

def get_action
     gets.downcase[0]
end

def edit_employee(employees)
    puts '[Editing employee]'
    print 'Enter id of an employee you want to edit: '
    id = gets.to_i

    employees.each do |employee|
        if employee.id == id 
            puts "Current full name: #{employee.full_name}"
            print "New full name: "
            employee.full_name = gets.chomp
            puts "Current ID: #{employee.id}"
            print "New ID: "
            employee.id = gets.to_i
        end
    end
end

puts "Employee-o-matic 4000"

employees = []

loop do
    print 'What do you want to do? '
    action = get_action

    case action 
    when 'a' then add_employee(employees)
    when 'v' then view_employees(employees)
    when 'e' then edit_employee(employees)
    when 'q' then quit
    else
        print_help
    end
end