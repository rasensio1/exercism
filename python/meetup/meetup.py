from datetime import date, timedelta

WEEKDAYS = {"Monday": 0, "Tuesday": 1, "Wednesday": 2,
            "Thursday": 3, "Friday": 4, "Saturday": 5,
            "Sunday":6}

def meetup_day(year, month, day_of_the_week, which):
    day_int = WEEKDAYS[day_of_the_week]
    
    if which == "teenth":
        my_date = date(year, month, 13)
        skip_days = (7 - (my_date.weekday() - day_int)) % 7
        my_date += timedelta(days=skip_days)

    elif which == "last":
        new_y = year + ((month + 1) // 13)
        new_m = (month % 12) + 1
        my_date = date(new_y, new_m, 1) - timedelta(days=1)
        skip_days = (my_date.weekday() - day_int) % 7
        my_date -= timedelta(days=skip_days)

    else: #1st, 2nd, etc.
        my_date = date(year, month, 1)
        skip_days = (7 - (my_date.weekday() - day_int)) % 7
        my_date += timedelta(days=skip_days, weeks=(int(which[0])-1))

        if my_date.month != month:
            raise MeetupDayException("No such date!")

    return my_date

class MeetupDayException(Exception):
    pass

