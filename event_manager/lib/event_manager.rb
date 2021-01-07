require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_phone(number)
  number = number.to_s.delete(' ')
  for i in (0..(number.length - 1))
    if number[i] !~ /\D+/ 
      next
    else
      number.slice!(i)
    end
  end
  
  n = number.length
  case n
  when n < 10
    return ""
  when 10
    return number
  when 11
    if number[0] == 1
      return number
    else 
      number.slice(0)
    end
  when n > 11
    return ""
  end
end

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zipcode,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
  end
end

def targeting(date)
  date
  x = DateTime.strptime(date, '%m/%d/%y %H:%M')
  p log_hour = x.hour
  p log_day = x.wday
  # the project doesn't say to actually do anything with this data, but it's correct.

end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

puts "EventManager initialized."

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  date = targeting(row[:regdate])
  name = row[:first_name]
  home_phone = clean_phone(row[:homephone])
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id,form_letter)
end



