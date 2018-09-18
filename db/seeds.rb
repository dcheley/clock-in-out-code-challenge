# 7 days of the week
day_1 = Date.today.at_beginning_of_week
day_2 = day_1 + 1
day_3 = day_2 + 1
day_4 = day_3 + 1
day_5 = day_4 + 1

# Clock in and out hours
time = Time.parse('24:00').seconds_since_midnight.seconds
time_1 = time + 9.hours.seconds
time_2 = time + 17.hours.seconds

# Format date and times into Datetime object for db
datetime_1 = day_1 + time_1
datetime_2 = day_1 + time_2
datetime_3 = day_2 + time_1
datetime_4 = day_2 + time_2
datetime_5 = day_3 + time_1
datetime_6 = day_3 + time_2
datetime_7 = day_4 + time_1
datetime_8 = day_4 + time_2
datetime_9 = day_5 + time_1
datetime_10 = day_5 + time_2

# Seed example user
User.create([
  { name:'Ian', email:'fake@email.com', password:'Testing#1' }
])

# Seeds to test weekly attendance within view
Attendance.create([
  { created_at: datetime_1, status: 1, user_id: 1 },
  { created_at: datetime_2, status: 2, user_id: 1 },
  { created_at: datetime_3, status: 1, user_id: 1 },
  { created_at: datetime_4, status: 2, user_id: 1 },
  { created_at: datetime_5, status: 1, user_id: 1 },
  { created_at: datetime_6, status: 2, user_id: 1 },
  { created_at: datetime_7, status: 1, user_id: 1 },
  { created_at: datetime_8, status: 2, user_id: 1 },
  { created_at: datetime_9, status: 1, user_id: 1 },
  { created_at: datetime_10, status: 2, user_id: 1 }
])
