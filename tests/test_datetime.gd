extends "res://addons/gut/test.gd"


func test_datetime():
	var datetime = DateTime.datetime({"year": 1970})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "1st of january, 1970 00:00:00")


func test_datetime_from_date():
	var datetime = DateTime.datetime(
		{"second": 30, "minute": 4, "hour": 12, "day": 7, "month": 1, "year": 2022}
	)
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "7th of january, 2022 12:04:30")
	datetime = DateTime.datetime(
		{"second": 30, "minute": 4, "hour": 23, "day": 7, "month": 1, "year": 2022}
	)
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "7th of january, 2022 23:04:30")
	assert_eq(datetime.to_string(), "2022-01-07 23:04:30")
	assert_eq(datetime.isoformat(), "2022-01-07T23:04:30")


func test_datetime_from_isoformat_fails():
	Engine.print_error_messages = false
	var datetime = DateTime.from_isoformat("")
	assert_null(datetime, "")
	datetime = DateTime.from_isoformat("\ud800")
	assert_null(datetime, "\ud800")
	datetime = DateTime.from_isoformat("009-03-04")
	assert_null(datetime, "009-03-04")
	datetime = DateTime.from_isoformat("123456789")
	assert_null(datetime, "123456789")
	datetime = DateTime.from_isoformat("200a-12-04")
	assert_null(datetime, "200a-12-04")
	datetime = DateTime.from_isoformat("2009-1a-04")
	assert_null(datetime, "2009-1a-04")
	datetime = DateTime.from_isoformat("2009-12-0a")
	assert_null(datetime, "2009-12-0a")
	datetime = DateTime.from_isoformat("2009-01-32")
	assert_null(datetime, "2009-01-32")
	datetime = DateTime.from_isoformat("2009-02-29")
	assert_null(datetime, "2009-02-29")
	datetime = DateTime.from_isoformat("2019-W53-1")
	assert_null(datetime, "2019-W53-1")
	datetime = DateTime.from_isoformat("2020-W54-1")
	assert_null(datetime, "2020-W54-1")
	datetime = DateTime.from_isoformat("2009\ud80002\ud80028")
	assert_null(datetime, "2009\ud80002\ud80028")
	datetime = DateTime.from_isoformat("00010101")
	assert_null(datetime, "00010101")
	datetime = DateTime.from_isoformat("20000101")
	assert_null(datetime, "20000101")
	datetime = DateTime.from_isoformat("20250102")
	assert_null(datetime, "20250102")
	datetime = DateTime.from_isoformat("99991231")
	assert_null(datetime, "99991231")
	datetime = DateTime.from_isoformat("2025W01")
	assert_null(datetime, "2025W01")
	datetime = DateTime.from_isoformat("2025-W01")
	assert_null(datetime, "2025-W01")
	datetime = DateTime.from_isoformat("2025W014")
	assert_null(datetime, "2025W014")
	datetime = DateTime.from_isoformat("2025-W01-4")
	assert_null(datetime, "2025-W01-4")
	datetime = DateTime.from_isoformat("2026W01")
	assert_null(datetime, "2026W01")
	datetime = DateTime.from_isoformat("2026-W01")
	assert_null(datetime, "2026-W01")
	datetime = DateTime.from_isoformat("2026W013")
	assert_null(datetime, "2026W013")
	datetime = DateTime.from_isoformat("2026-W01-3")
	assert_null(datetime, "2026-W01-3")
	datetime = DateTime.from_isoformat("2022W52")
	assert_null(datetime, "2022W52")
	datetime = DateTime.from_isoformat("2022-W52")
	assert_null(datetime, "2022-W52")
	datetime = DateTime.from_isoformat("2022W527")
	assert_null(datetime, "2022W527")
	datetime = DateTime.from_isoformat("2022-W52-7")
	assert_null(datetime, "2022-W52-7")
	datetime = DateTime.from_isoformat("2015W534")
	assert_null(datetime, "2015W534")
	datetime = DateTime.from_isoformat("2015-W53-4")
	assert_null(datetime, "2015-W53-4")
	datetime = DateTime.from_isoformat("2015-W53-5")
	assert_null(datetime, "2015-W53-5")
	datetime = DateTime.from_isoformat("2020W531")
	assert_null(datetime, "2020W531")
	datetime = DateTime.from_isoformat("2020-W53-1")
	assert_null(datetime, "2020-W53-1")
	datetime = DateTime.from_isoformat("2020-W53-6")
	assert_null(datetime, "2020-W53-6")
	datetime = DateTime.from_isoformat("2022W01")
	assert_null(datetime, "2022W01")
	datetime = DateTime.from_isoformat("2022W52520")
	assert_null(datetime, "2022W52520")
	datetime = DateTime.from_isoformat("2022W527520")
	assert_null(datetime, "2022W527520")
	datetime = DateTime.from_isoformat("2026W01516")
	assert_null(datetime, "2026W01516")
	datetime = DateTime.from_isoformat("2026W013516")
	assert_null(datetime, "2026W013516")
	datetime = DateTime.from_isoformat("2025W01503")
	assert_null(datetime, "2025W01503")
	datetime = DateTime.from_isoformat("2025W014503")
	assert_null(datetime, "2025W014503")
	datetime = DateTime.from_isoformat("2025W01512")
	assert_null(datetime, "2025W01512")
	datetime = DateTime.from_isoformat("2025W014512")
	assert_null(datetime, "2025W014512")
	datetime = DateTime.from_isoformat("2025W014T121431")
	assert_null(datetime, "2025W014T121431")
	datetime = DateTime.from_isoformat("2026W013T162100")
	assert_null(datetime, "2026W013T162100")
	datetime = DateTime.from_isoformat("2026W013 162100")
	assert_null(datetime, "2026W013 162100")
	datetime = DateTime.from_isoformat("2022W527T202159")
	assert_null(datetime, "2022W527T202159")
	datetime = DateTime.from_isoformat("2022W527 202159")
	assert_null(datetime, "2022W527 202159")
	datetime = DateTime.from_isoformat("2025W014 121431")
	assert_null(datetime, "2025W014 121431")
	datetime = DateTime.from_isoformat("2025W014T030405")
	assert_null(datetime, "2025W014T030405")
	datetime = DateTime.from_isoformat("2025W014 030405")
	assert_null(datetime, "2025W014 030405")
	datetime = DateTime.from_isoformat("2020-W53-6T03:04:05")
	assert_null(datetime, "2020-W53-6T03:04:05")
	datetime = DateTime.from_isoformat("2020W537 03:04:05")
	assert_null(datetime, "2020W537 03:04:05")
	datetime = DateTime.from_isoformat("2025-W01-4T03:04:05")
	assert_null(datetime, "2025-W01-4T03:04:05")
	datetime = DateTime.from_isoformat("2025-W01-4T03:04:05.678901")
	assert_null(datetime, "2025-W01-4T03:04:05.678901")
	datetime = DateTime.from_isoformat("2025-W01-4T12:14:31")
	assert_null(datetime, "2025-W01-4T12:14:31")
	datetime = DateTime.from_isoformat("2025-W01-4T12:14:31.012345")
	assert_null(datetime, "2025-W01-4T12:14:31.012345")
	datetime = DateTime.from_isoformat("2026-W01-3T16:21:00")
	assert_null(datetime, "2026-W01-3T16:21:00")
	datetime = DateTime.from_isoformat("2026-W01-3T16:21:00.000000")
	assert_null(datetime, "2026-W01-3T16:21:00.000000")
	datetime = DateTime.from_isoformat("2022-W52-7T20:21:59")
	assert_null(datetime, "2022-W52-7T20:21:59")
	datetime = DateTime.from_isoformat("2022-W52-7T20:21:59.999999")
	assert_null(datetime, "2022-W52-7T20:21:59.999999")
	datetime = DateTime.from_isoformat("2025-W01003+00")
	assert_null(datetime, "2025-W01003+00")
	datetime = DateTime.from_isoformat("2025-01-02T030405")
	assert_null(datetime, "2025-01-02T030405")
	datetime = DateTime.from_isoformat("20250102")
	assert_null(datetime, "20250102")
	datetime = DateTime.from_isoformat("20250102T03")
	assert_null(datetime, "20250102T03")
	datetime = DateTime.from_isoformat("20250102T03:04")
	assert_null(datetime, "20250102T03:04")
	datetime = DateTime.from_isoformat("20250102T03:04:05")
	assert_null(datetime, "20250102T03:04:05")
	datetime = DateTime.from_isoformat("20250102T030405")
	assert_null(datetime, "20250102T030405")
	datetime = DateTime.from_isoformat("20250102T03:04:05.6")
	assert_null(datetime, "20250102T03:04:05.6")
	datetime = DateTime.from_isoformat("20250102T03:04:05,6")
	assert_null(datetime, "20250102T03:04:05,6")
	datetime = DateTime.from_isoformat("20250102T03:04:05.678")
	assert_null(datetime, "20250102T03:04:05.678")
	datetime = DateTime.from_isoformat("20250102T03:04:05,678")
	assert_null(datetime, "20250102T03:04:05,678")
	datetime = DateTime.from_isoformat("20250102T03:04:05.678901")
	assert_null(datetime, "20250102T03:04:05.678901")
	datetime = DateTime.from_isoformat("20250102T030405.678901")
	assert_null(datetime, "20250102T030405.678901")
	datetime = DateTime.from_isoformat("20250102T030405,678901")
	assert_null(datetime, "20250102T030405,678901")
	datetime = DateTime.from_isoformat("20250102T030405.6789010")
	assert_null(datetime, "20250102T030405.6789010")
	datetime = DateTime.from_isoformat("2025-01-02T0304")
	assert_null(datetime, "2025-01-02T0304")
	datetime = DateTime.from_isoformat("2025-01-02T03:04:05.6")
	assert_null(datetime, "2025-01-02T03:04:05.6")
	datetime = DateTime.from_isoformat("2025-01-02T03:04:05,6")
	assert_null(datetime, "2025-01-02T03:04:05,6")
	datetime = DateTime.from_isoformat("2025-01-02T03:04:05.678")
	assert_null(datetime, "2025-01-02T03:04:05.678")
	datetime = DateTime.from_isoformat("2025-01-02T03:04:05.678901")
	assert_null(datetime, "2025-01-02T03:04:05.678901")
	datetime = DateTime.from_isoformat("2025-01-02T03:04:05,678901")
	assert_null(datetime, "2025-01-02T03:04:05,678901")
	datetime = DateTime.from_isoformat("2025-01-02T030405.678901")
	assert_null(datetime, "2025-01-02T030405.678901")
	datetime = DateTime.from_isoformat("2025-01-02T030405,678901")
	assert_null(datetime, "2025-01-02T030405,678901")
	datetime = DateTime.from_isoformat("2025-01-02T03:04:05.6789010")
	assert_null(datetime, "2025-01-02T03:04:05.6789010")
	datetime = DateTime.from_isoformat("2009-04-19T03:15:45.2345")
	assert_null(datetime, "2009-04-19T03:15:45.2345")
	datetime = DateTime.from_isoformat("2009-04-19T03:15:45.1234567")
	assert_null(datetime, "2009-04-19T03:15:45.1234567")
	datetime = DateTime.from_isoformat("2025-01-02T03:04:05,678")
	assert_null(datetime, "2025-01-02T03:04:05,678")
	datetime = DateTime.from_isoformat("2025-01-02T03:04:05+00")
	assert_null(datetime, "2025-01-02T03:04:05+00")
	datetime = DateTime.from_isoformat("2025-01-02T03:04:05Z")
	assert_null(datetime, "2025-01-02T03:04:05Z")
	datetime = DateTime.from_isoformat("2025-01-02003:04:05,6+00:00:00.00")
	assert_null(datetime, "2025-01-02003:04:05,6+00:00:00.00")
	datetime = DateTime.from_isoformat("2000-01-01T00+21")
	assert_null(datetime, "2000-01-01T00+21")
	datetime = DateTime.from_isoformat("2025-01-02T03:05:06+0300")
	assert_null(datetime, "2025-01-02T03:05:06+0300")
	datetime = DateTime.from_isoformat("2025-01-02T03:05:06-0300")
	assert_null(datetime, "2025-01-02T03:05:06-0300")
	datetime = DateTime.from_isoformat("2025-01-02T03:04:05+0000")
	assert_null(datetime, "2025-01-02T03:04:05+0000")
	datetime = DateTime.from_isoformat("2025-01-02T03:05:06+03")
	assert_null(datetime, "2025-01-02T03:05:06+03")
	datetime = DateTime.from_isoformat("2025-01-02T03:05:06-03")
	assert_null(datetime, "2025-01-02T03:05:06-03")
	datetime = DateTime.from_isoformat("2020-01-01T03:05:07.123457-05:00")
	assert_null(datetime, "2020-01-01T03:05:07.123457-05:00")
	datetime = DateTime.from_isoformat("2020-01-01T03:05:07.123457-0500")
	assert_null(datetime, "2020-01-01T03:05:07.123457-0500")
	datetime = DateTime.from_isoformat("2020-06-01T04:05:06.111111-04:00")
	assert_null(datetime, "2020-06-01T04:05:06.111111-04:00")
	datetime = DateTime.from_isoformat("2020-06-01T04:05:06.111111-0400")
	assert_null(datetime, "2020-06-01T04:05:06.111111-0400")
	datetime = DateTime.from_isoformat("2021-10-31T01:30:00.000000+01:00")
	assert_null(datetime, "2021-10-31T01:30:00.000000+01:00")
	datetime = DateTime.from_isoformat("2021-10-31T01:30:00.000000+0100")
	assert_null(datetime, "2021-10-31T01:30:00.000000+0100")
	datetime = DateTime.from_isoformat("2025-01-02T03:04:05,6+000000.00")
	assert_null(datetime, "2025-01-02T03:04:05,6+000000.00")
	datetime = DateTime.from_isoformat("2025-01-02T03:04:05,678+00:00:10")
	assert_null(datetime, "2025-01-02T03:04:05,678+00:00:10")
	Engine.print_error_messages = true


func test_datetime_from_isoformat():
	var datetime = DateTime.from_isoformat("2022-01-07T23:04:30")
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "7th of january, 2022 23:04:30")
	assert_not_null(datetime)
	assert_eq(datetime.to_string(), "2022-01-07 23:04:30")
	assert_not_null(datetime)
	assert_eq(datetime.isoformat(), "2022-01-07T23:04:30")
	datetime = DateTime.from_isoformat("0001-01-01")
	assert_not_null(datetime)
	assert_eq(datetime.to_string(), "0001-01-01 00:00:00")
	datetime = DateTime.from_isoformat("2000-01-01")
	assert_not_null(datetime)
	assert_eq(datetime.to_string(), "2000-01-01 00:00:00")
	datetime = DateTime.from_isoformat("2025-01-02")
	assert_not_null(datetime)
	assert_eq(datetime.to_string(), "2025-01-02 00:00:00")
	datetime = DateTime.from_isoformat("9999-12-31")
	assert_not_null(datetime)
	assert_eq(datetime.to_string(), "9999-12-31 00:00:00")
	datetime = DateTime.from_isoformat("2025-01-02")
	assert_not_null(datetime)
	assert_eq(datetime.to_string(), "2025-01-02 00:00:00")
	datetime = DateTime.from_isoformat("2025-01-02T03")
	assert_not_null(datetime)
	assert_eq(datetime.to_string(), "2025-01-02 03:00:00")
	datetime = DateTime.from_isoformat("2025-01-02T03:04")
	assert_not_null(datetime)
	assert_eq(datetime.to_string(), "2025-01-02 03:04:00")
	datetime = DateTime.from_isoformat("2025-01-02T03:04:05")
	assert_not_null(datetime)
	assert_eq(datetime.to_string(), "2025-01-02 03:04:05")


func test_isoformat():
	var datetime = DateTime.datetime(
		{"second": 1, "minute": 5, "hour": 4, "day": 3, "month": 2, "year": 1}
	)
	assert_not_null(datetime)
	assert_eq(datetime.isoformat(), "0001-02-03T04:05:01")
	assert_not_null(datetime)
	assert_eq(datetime.isoformat("T"), "0001-02-03T04:05:01")
	assert_not_null(datetime)
	assert_eq(datetime.isoformat(" "), "0001-02-03 04:05:01")
	assert_not_null(datetime)
	assert_eq(datetime.isoformat("\\x00"), "0001-02-03\\x0004:05:01")
	assert_not_null(datetime)
	assert_eq(datetime.isoformat("\ud800"), "0001-02-03\ud80004:05:01")
	assert_not_null(datetime)
	assert_eq(datetime.isoformat("T", "hours"), "0001-02-03T04")
	assert_not_null(datetime)
	assert_eq(datetime.isoformat("T", "minutes"), "0001-02-03T04:05")
	assert_not_null(datetime)
	assert_eq(datetime.isoformat("T", "seconds"), "0001-02-03T04:05:01")
	assert_not_null(datetime)
	assert_eq(datetime.isoformat(" ", "minutes"), "0001-02-03 04:05")
	datetime = DateTime.datetime({"day": 2, "month": 3, "year": 2})
	assert_not_null(datetime)
	assert_eq(datetime.isoformat(), "0002-03-02T00:00:00")
	assert_not_null(datetime)
	assert_eq(datetime.isoformat("T"), "0002-03-02T00:00:00")
	assert_not_null(datetime)
	assert_eq(datetime.isoformat(" "), "0002-03-02 00:00:00")


func test_datetime_from_now():
	var os_now = OS.get_datetime()
	var datetime = DateTime.now()
	assert_not_null(datetime)
	assert_eq(datetime.second, os_now["second"], "second should match os.now")
	assert_not_null(datetime)
	assert_eq(datetime.minute, os_now["minute"], "minute should match os.now")
	assert_not_null(datetime)
	assert_eq(datetime.hour, os_now["hour"], "hour should match os.now")
	assert_not_null(datetime)
	assert_eq(datetime.day, os_now["day"], "day should match os.now")
	assert_not_null(datetime)
	assert_eq(datetime.month, os_now["month"], "month should match os.now")
	assert_not_null(datetime)
	assert_eq(datetime.year, os_now["year"], "year should match os.now")


func test_datetime_minute():
	var datetime = DateTime.datetime({"year": 1970})
	datetime = datetime.add_time({"minute": 1})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "1st of january, 1970 00:01:00")
	datetime = datetime.add_time({"minute": 59})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "1st of january, 1970 01:00:00")
	datetime = datetime.add_time({"minute": 59 * 24})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "2nd of january, 1970 00:36:00")


func test_datetime_hour():
	var datetime = DateTime.datetime({"year": 1970})
	datetime = datetime.add_time({"hour": 1})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "1st of january, 1970 01:00:00")
	datetime = datetime.add_time({"hour": 2})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "1st of january, 1970 03:00:00")
	datetime = datetime.add_time({"hour": 24})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "2nd of january, 1970 03:00:00")
	datetime = datetime.add_time({"hour": 25})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "3rd of january, 1970 04:00:00")
	datetime = datetime.add_time({"hour": 27})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "4th of january, 1970 07:00:00")
	datetime = datetime.add_time({"hour": 30})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "5th of january, 1970 13:00:00")
	datetime = datetime.add_time({"hour": 364})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "20th of january, 1970 17:00:00")
	assert_not_null(datetime)
	assert_eq(datetime.weekday_name, "tuesday")


func test_datetime_day():
	var datetime = DateTime.datetime({"year": 1970})
	datetime = datetime.add_time({"day": 1})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "2nd of january, 1970 00:00:00")
	datetime = datetime.add_time({"day": 2})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "4th of january, 1970 00:00:00")
	datetime = datetime.add_time({"day": 3})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "7th of january, 1970 00:00:00")
	datetime = datetime.add_time({"day": 24})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "31st of january, 1970 00:00:00")
	datetime = datetime.add_time({"day": 25})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "25th of february, 1970 00:00:00")
	datetime = datetime.add_time({"day": 27})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "24th of march, 1970 00:00:00")
	datetime = datetime.add_time({"day": 30})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "23rd of april, 1970 00:00:00")
	datetime = datetime.add_time({"day": 364})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "22nd of april, 1971 00:00:00")


func test_datetime_month():
	var datetime = DateTime.datetime({"year": 1970})
	datetime = datetime.add_time({"month": 1})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "1st of february, 1970 00:00:00")
	datetime = datetime.add_time({"month": 1})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "1st of march, 1970 00:00:00")
	datetime = datetime.add_time({"month": 1})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "1st of april, 1970 00:00:00")
	datetime = datetime.add_time({"month": 1})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "1st of may, 1970 00:00:00")
	datetime = datetime.add_time({"month": 1})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "1st of june, 1970 00:00:00")
	datetime = datetime.add_time({"month": 1})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "1st of july, 1970 00:00:00")
	datetime = datetime.add_time({"month": 1})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "1st of august, 1970 00:00:00")
	datetime = datetime.add_time({"month": 1})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "1st of september, 1970 00:00:00")
	datetime = datetime.add_time({"month": 1})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "1st of october, 1970 00:00:00")
	datetime = datetime.add_time({"month": 1})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "1st of november, 1970 00:00:00")
	datetime = datetime.add_time({"month": 1})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "1st of december, 1970 00:00:00")
	datetime = datetime.add_time({"month": 1})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "1st of january, 1971 00:00:00")

	datetime = datetime.add_time({"day": 30})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "31st of january, 1971 00:00:00")
	datetime = datetime.add_time({"month": 1})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y %H:%M:%S"), "28th of february, 1971 00:00:00")


func test_datetime_year():
	var datetime = DateTime.datetime({"year": 2022})
	assert_not_null(datetime)
	assert_eq(datetime.year, 2022)
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y"), "1st of january, 2022")
	datetime = datetime.add_time({"year": 2022})
	assert_not_null(datetime)
	assert_eq(datetime.year, 4044)
	datetime = datetime.add_time({"year": 2022})
	assert_not_null(datetime)
	assert_eq(datetime.year, 6066)
	datetime = datetime.add_time({"year": 2022})
	assert_not_null(datetime)
	assert_eq(datetime.year, 8088)
	datetime = datetime.add_time({"year": 2022})
	assert_not_null(datetime)
	assert_eq(datetime.year, 10110)
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y"), "1st of january, 10110")
	datetime = datetime.add_time({"year": -10109})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y"), "1st of january, 0001")
	datetime = DateTime.datetime({"year": 1972, "month": 02, "day": 29})
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y"), "29th of february, 1972")
	datetime = datetime.add_years(-1)
	assert_not_null(datetime)
	assert_eq(datetime.strftime("%D of %B, %Y"), "28th of february, 1971")


func test_datetime_replace():
	var datetime = DateTime.datetime({"year": 2022})
	assert_not_null(datetime)
	datetime = datetime.replace({"day": 31})
	assert_eq(datetime.to_string(), "2022-01-31 00:00:00")
	datetime = datetime.replace({"year": 1970, "hour": 12})
	assert_eq(datetime.to_string(), "1970-01-31 12:00:00")
