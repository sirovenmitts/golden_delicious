# GoldenDelicious
## Tasty info about an Apple serial number

Apple tries really hard to make it impossible to know anything about a serial number. Additionally, Apple uses about 5 different ways to identify a computer. This gem aims to make things a little easier, by pulling info from 2 different sources (maybe more in the future).

NOTE: Every time you use this gem you make at least 3 HTTP requests.

### In the beginning

A while ago I found out that a GET to https://selfsolve.apple.com/warrantyChecker.do with your serial number as a parameter would return a big blob of JSON with information about your device. This was great, but Apple doesn't provide all the info I needed. So, I kind of gave up for a while. 

### Things start to look up

Then I found out that everymac.com has most of the rest of the information I need; it just needs to be extracted.

So, there we go. You can use:

    GoldenDelicious::GoldenDelicious.new SERIAL_NUMBER_GOES_HERE

And that will probably work.

If you don't care about all the information (for example, you want only to know if a serial number is valid) then you can use either:

    GoldenDelicious::AppleInfo.new SERIAL_NUMBER_ALSO_GOES_HERE

 OR:

     GoldenDelicious::EverymacInfo.new SHORT_MODEL_GOES_HERE

### In the end

This is just a gem I need for work projects, but if you want to help me, please feel free. Right now my tests woefully brittle: I don't have any serial numbers to test edge cases (older computers, iPhones, iPods, etc.). Please feel free to send me your serial number; I won't do anything weird with it - just put it in some tests to ensure that this gem does what it's supposed to.