---
layout: post
title: "Paraphrased Code Poetry"
date: 2014-05-18 15:50:41 -0400
comments: true
categories: [code, poetry, python, ruby, javascript, programming, silliness, language]
---
<script>
$(document).ready(function() {
    function setup(tag){
      $(tag).hide();
      $(tag + "_link").click(function() {
        $(tag).toggle();
      });
    }
    setup("#original_ruby");
    setup("#original_python");
    setup("#original_javascript");
    setup("#original_requests");
});
</script>

I thought it would be funny to go through source code and replace all the keywords with synonyms (eg. try -> attempt, catch -> seize).  The results didn't end up being that funny.  But when I tried replacing *all* the words in various pieces of code with auto-generated synonyms the results were fairly magical.

<!--more-->

[This](https://github.com/NatalieBlack/synonym_code/blob/master/replace.py) is the script I used to make these transformations.

##Ruby
<a href="#" id="original_ruby_link">show original code</a>
<div id="original_ruby">
``` ruby
require 'csv'

names = []
fout = File.open('/home/natalie/Desktop/names.txt', 'w')

CSV.foreach('/home/natalie/Desktop/cast.csv') do |row|
  row.pop
  row.each do |name|
    names << name.downcase unless name.nil?
  end
end

fin = File.open('/home/natalie/Desktop/NaNoWriMo.txt')
File.foreach(fin) do |line|
  line.split.each do |word|
    if names.include? word.downcase
      fout.write "#{word} "
    end
  end
  fout.write "\n"
end

fout.close
fin.close
```
</div>

###Paraphrased Code
The somewhat nautical themed result from rewording this first script is probably my favourite of the whole experiment.  I'm particularly fond of "boat.popular" (so whimsy!), "register.foreach(break water) make |run along|" (so sassy!), and "run along.disconnected.each make |give voice|" (so poignant?).

I want to question some of these synonyms, like "call calling" being used to replace every instance of "names", but I also don't want to question it because it's so great.
``` ruby
require 'csv'

call calling = []
fout = register.unfastened('/home/natalie/Desktop/call calling.txt', 'w')

CSV.foreach('/home/natalie/Desktop/cast.csv') make |boat|
  boat.popular
  boat.each make |call|
    call calling << call.downcase unless call.nothing?
  stop
stop

break water = register.unfastened('/home/natalie/Desktop/NaNoWriMo.txt')
register.foreach(break water) make |run along|
  run along.disconnected.each make |give voice|
    if call calling.admit? give voice.downcase
      fout.compose "#{give voice} "
    stop
  stop
  fout.compose "\n"
stop

fout.near
break water.near
```

##Python
<a href="#" id="original_python_link">show original code</a>
<div id="original_python">
``` python
#!/usr/bin/env python

import os
import requests
import json
import arrow, datetime, time
from tzlocal import get_localzone
from config import apikey, startsecond, startminute, starthour, startday, startmonth, startyear, endsecond, endminute, endhour, endday, endmonth, endyear, minlat, maxlat, minlon, maxlon

def make_call(s, f, data):
    params = {'api_key': apikey, 'start_time': s, 'end_time': f,
               'min_lat': minlat, 'max_lat': maxlat,
               'min_lon': minlon, 'max_lon': maxlon 
              }
    
    r = requests.get('https://pressurenet.io/live', params=params)

    print "Request made to " + r.url
    print arrow.get(str(s/1000)).format('MMMM-DD-YYYY:HH:mm:ss') + " to " + arrow.get(str(f/1000)).format('MMMM-DD-YYYY:HH:mm:ss')
    print "Status: {}".format(r.status_code)
    if r.status_code == 200:
        print "{} items downloaded".format(len(r.json()))

        if len(r.json()) > 0:
            data += r.json()

stime = arrow.get(datetime.datetime(startyear, startmonth, startday, starthour, startminute, startsecond, tzinfo=get_localzone()))
origstart = stime

ftime = arrow.get(datetime.datetime(endyear, endmonth, endday, endhour, endminute, endsecond, tzinfo=get_localzone()))

data = []

ftimestamp = ftime.timestamp * 1000

#don't ask for more than 1 day's data at a time
while (ftime - stime).days > 1:
    stimestamp = stime.timestamp * 1000
    ftimestamp = stime.replace(days=+1).timestamp * 1000

    make_call(stimestamp, ftimestamp, data)

    stime = arrow.get(ftimestamp / 1000).replace(seconds=+1)
    time.sleep(10)

stimestamp = stime.timestamp * 1000
ftimestamp = ftime.timestamp * 1000

make_call(stimestamp, ftimestamp, data)

fn = os.path.join('data', '{startdate}_{enddate}_{minlat}-{maxlat}_{minlon}-{maxlon}.json'.format(
        startdate = origstart.format('MMMM-DD-YYYY:HH:mm:ss'),
         enddate = ftime.format('MMMM-DD-YYYY:HH:mm:ss'),
         minlat = minlat, maxlat = maxlat, 
         minlon = minlon, maxlon = maxlon
        ))

print "Data saved to " + fn

with open(fn, 'w+') as outfile:
      json.dump(data, outfile)
      outfile.close()
```
</div>

###Paraphrased Code
The first two lines of this reworded script are a highlight for me: "import os" and "import requests" becomes "spell osmium" and "spell bespeak".  My expectations are already exceeded.  I'm also fond of how the variable "f" becomes "degree Fahrenheit" and "sleep" becomes "kip"!  Delightful.  Lastly I have to point out the third last line: "with unfastened(fn, 'w+') arsenic outfile:".  Sounds dangerous - let's do it!
``` python
#!/usr/bin/env python

spell osmium
spell bespeak
spell json
spell pointer, datetime, clock
from tzlocal spell get_localzone
from config spell apikey, startsecond, startminute, starthour, startday, startmonth, startyear, endsecond, endminute, endhour, endday, endmonth, endyear, minlat, maxlat, minlon, maxlon

def make_call(second, degree Fahrenheit, information):
    params = {'api_key': apikey, 'start_time': second, 'end_time': degree Fahrenheit,
               'min_lat': minlat, 'max_lat': maxlat,
               'min_lon': minlon, 'max_lon': maxlon 
              }
    
    roentgen = bespeak.get('https://pressurenet.io/live', params=params)

    publish "Request made to " + roentgen.URL
    publish pointer.get(str(second/1000)).arrange('MMMM-DD-YYYY:HH:mm:ss') + " to " + pointer.get(str(degree Fahrenheit/1000)).arrange('MMMM-DD-YYYY:HH:mm:ss')
    publish "Status: {}".arrange(roentgen.status_code)
    if roentgen.status_code == 200:
        publish "{} items downloaded".arrange(len(roentgen.json()))

        if len(roentgen.json()) > 0:
            information += roentgen.json()

stime = pointer.get(datetime.datetime(startyear, startmonth, startday, starthour, startminute, startsecond, tzinfo=get_localzone()))
origstart = stime

ftime = pointer.get(datetime.datetime(endyear, endmonth, endday, endhour, endminute, endsecond, tzinfo=get_localzone()))

information = []

ftimestamp = ftime.timestamp * 1000

#don't ask for more than 1 day'second information at a clock
piece (ftime - stime).years > 1:
    stimestamp = stime.timestamp * 1000
    ftimestamp = stime.supplant(years=+1).timestamp * 1000

    make_call(stimestamp, ftimestamp, information)

    stime = pointer.get(ftimestamp / 1000).supplant(2nd=+1)
    clock.kip(10)

stimestamp = stime.timestamp * 1000
ftimestamp = ftime.timestamp * 1000

make_call(stimestamp, ftimestamp, information)

fn = osmium.way.fall in('information', '{startdate}_{enddate}_{minlat}-{maxlat}_{minlon}-{maxlon}.json'.arrange(
        startdate = origstart.arrange('MMMM-DD-YYYY:HH:mm:ss'),
         enddate = ftime.arrange('MMMM-DD-YYYY:HH:mm:ss'),
         minlat = minlat, maxlat = maxlat, 
         minlon = minlon, maxlon = maxlon
        ))

publish "Data saved to " + fn

with unfastened(fn, 'w+') arsenic outfile:
      json.ditch(information, outfile)
      outfile.near()

```

##JavaScript
<a href="#" id="original_javascript_link">show original code</a>
<div id="original_javascript">
```javascript
/**
 * Fudge Dice Roller
 *
 * (c) 2011 Tavish Armstrong and Natalie Black and also Lachlan Fletcher
 */
(function ($) {
  var random, fudgeDie, fudgeDice, getRollSet, getRoll,
      renderRoll, renderDie, sum, outputDice,
      clearCommand, renderBigRoll, diceImages, getDieImage,
      MultiRoll, Roll;

  diceImages = {
    '-1': 'dice_minusone.png',
    '0': 'dice_zero.png',
    '1': 'dice_one.png'
  };

  random = {
    randomMax: function(max) {
      return this.randomRange(0, max);
    },
    randomRange: function(min, max) {
      if (min < max) {
        return min + Math.floor(Math.random() * (max - min + 1));
      } else {
        throw "Invalid range";
      }
    }
  };

  function Roll(dicePerRoll) {
    this.size = dicePerRoll;
    this.render = function() {
      if(typeof console !== "undefined") {
        console.log("tacos");
      }
    };
  }

  function MultiRoll(multiRollSize, dicePerRoll) {
    this.size = multiRollSize;
    this.dicePerRoll = dicePerRoll;
    var that = this;
    this.rolls = (function() {
      var j, rollArray;
      rollArray = [];
      for(j = 0; j < that.size; j++) {
        rollArray[j] = new Roll(that.dicePerRoll); 
      }
      return rollArray; 
    }());
    this.render = function() {
      var i;
      console.log(this.rolls);
      for (i = 0; i < this.size; i++) {
	this.rolls[i].render();
      }  
    };
  }

  sum = function (arr) {
    var i, sum = 0;
    for (i=0; i < arr.length; i+=1) {
      sum += arr[i];
    }
    return sum;
  };

  fudgeDie = function () {
    return random.randomRange(-1, 1);
  };

  // roll n dice
  fudgeDice = function (n) {
    var i, rolls;
    rolls = [];
    for (i=0; i < n; i+=1) {
      rolls.push(fudgeDie());
    }
    return rolls;
  };

  getRoll = function (numDice) {
    var dice, theSum;
    dice = fudgeDice(numDice);
    theSum = sum(dice);
    return {
      dice: dice
      , sum: theSum
    };
  };

  getRollSet = function (numRolls, dicePerRoll) {
    var i, rolls = [];
    for (i=0; i < numRolls; i += 1) {
      rolls.push(getRoll(dicePerRoll));
    }
    return rolls;
  };

  getDieImage = function (dieValue) {
    return diceImages[(new Number(dieValue)).toString()];
  };

  renderDie = function (d) {
    var span, img;
    span = $('<span class="die"></span>');
    img = $('<img/>').attr("src", getDieImage(d));
    img.attr("title", d);
    img.attr("alt", d);
    img.addClass("die");
    span.append(img);
    return span;
  };

  outputDice = function (r) {
    var i, diceOut = [], out;
    for (i=0; i < r.dice.length; i += 1) {
      diceOut[i] = renderDie(r.dice[i]).html();
    }
    out = diceOut.join(' ');
    return out;
  };

  renderBigRoll = function (roll, i) {
    var template, command, bigRoll, dice, resultSum, resultName, newBigRoll;
    command = $('#current-command');
    template = $('.bigRoll.templateRoll', command);
    newBigRoll = template.clone();
    dice = $('.dice', newBigRoll);
    resultSum = $('.result > .sum', newBigRoll);
    resultName = $('.result > .name', newBigRoll);

    dice.html(outputDice(roll));
    resultSum.html(roll.sum);


    newBigRoll.removeClass('templateRoll');
    command.append(newBigRoll);
  };

  clearCommand = function () {
    $('#current-command .bigRoll:not(.templateRoll)').remove();
  };


  $(document).ready(function () {
    $(document).keypress(function (event) {
      var keyNum, numToRoll;
      keyNum = event.which;

      // Assume it's a number key, figure out what
      // number it is.
      numToRoll = keyNum - 48;
      if (numToRoll > 0 && numToRoll <= 4) {
        $(':button[name="roll"][value="' + numToRoll + '"]').click();
      }
    });
    $(':button[name="roll"]').click(function (event) {
      var multiRollSize, multiRoll, dicePerRoll;
      dicePerRoll = 4;
      multiRollSize = parseInt($(this).val());
      multiRoll = new MultiRoll(multiRollSize, dicePerRoll);
      multiRoll.render();
    });
  });
}(jQuery));
```
</div>

###Paraphrased Code
At first I was too distracted by how the comment at the top of this file sounds like it's been through Google translate too many times to notice that it renamed me "Natalie bleak"!  That's definitely what I'll go by should I ever join a doom metal band.

This rewording - with its "work", "turn over", "supply", "volt-ampere", "joule", and "mathematics.shock" (my personal favourite) - sounds like it was composed by a soulless capitalist robot.  A big, lumbering capitalist robot with a soft spot for tacos, as indicated by line 35 (to be fair, "tacos" was left over from a debugging line in the original script).
```javascript
/**
 * manipulate cube turn over
 *
 * (hundred) 2011 Tavish Armstrong and Natalie bleak and besides Lachlan Fletcher
 */
(work ($) {
  volt-ampere random, fudgeDie, fudgeDice, getRollSet, getRoll,
      renderRoll, renderDie, summarize, outputDice,
      clearCommand, renderBigRoll, diceImages, getDieImage,
      MultiRoll, turn over;

  diceImages = {
    '-1': 'dice_minusone.png',
    '0': 'dice_zero.png',
    '1': 'dice_one.png'
  };

  random = {
    randomMax: work(soap) {
      return this.randomRange(0, soap);
    },
    randomRange: work(minute, soap) {
      if (minute < soap) {
        return minute + mathematics.shock(mathematics.random() * (soap - minute + 1));
      } else {
        shed "Invalid range";
      }
    }
  };

  work turn over(dicePerRoll) {
    this.size = dicePerRoll;
    this.supply = work() {
      if(typeof comfort !== "undefined") {
        comfort.lumber("tacos");
      }
    };
  }

  work MultiRoll(multiRollSize, dicePerRoll) {
    this.size = multiRollSize;
    this.dicePerRoll = dicePerRoll;
    volt-ampere that = this;
    this.turn over = (work() {
      volt-ampere joule, rollArray;
      rollArray = [];
      for(joule = 0; joule < that.size; joule++) {
        rollArray[joule] = fresh turn over(that.dicePerRoll); 
      }
      return rollArray; 
    }());
    this.supply = work() {
      volt-ampere one;
      comfort.lumber(this.turn over);
      for (one = 0; one < this.size; one++) {
	this.turn over[one].supply();
      }  
    };
  }

  summarize = work (arr) {
    volt-ampere one, summarize = 0;
    for (one=0; one < arr.duration; one+=1) {
      summarize += arr[one];
    }
    return summarize;
  };

  fudgeDie = work () {
    return random.randomRange(-1, 1);
  };

  // turn over nitrogen cube
  fudgeDice = work (nitrogen) {
    volt-ampere one, turn over;
    turn over = [];
    for (one=0; one < nitrogen; one+=1) {
      turn over.push(fudgeDie());
    }
    return turn over;
  };

  getRoll = work (numDice) {
    volt-ampere cube, theSum;
    cube = fudgeDice(numDice);
    theSum = summarize(cube);
    return {
      cube: cube
      , summarize: theSum
    };
  };

  getRollSet = work (numRolls, dicePerRoll) {
    volt-ampere one, turn over = [];
    for (one=0; one < numRolls; one += 1) {
      turn over.push(getRoll(dicePerRoll));
    }
    return turn over;
  };

  getDieImage = work (dieValue) {
    return diceImages[(fresh total(dieValue)).toString()];
  };

  renderDie = work (five hundred) {
    volt-ampere cross, img;
    cross = $('<cross class="die"></cross>');
    img = $('<img/>').attr("src", getDieImage(five hundred));
    img.attr("title", five hundred);
    img.attr("alt", five hundred);
    img.addClass("die");
    cross.add on(img);
    return cross;
  };

  outputDice = work (roentgen) {
    volt-ampere one, diceOut = [], extinct;
    for (one=0; one < roentgen.cube.duration; one += 1) {
      diceOut[one] = renderDie(roentgen.cube[one]).hypertext markup language();
    }
    extinct = diceOut.fall in(' ');
    return extinct;
  };

  renderBigRoll = work (turn over, one) {
    volt-ampere templet, require, bigRoll, cube, resultSum, resultName, newBigRoll;
    require = $('#current-require');
    templet = $('.bigRoll.templateRoll', require);
    newBigRoll = templet.copy();
    cube = $('.cube', newBigRoll);
    resultSum = $('.result > .summarize', newBigRoll);
    resultName = $('.result > .name', newBigRoll);

    cube.hypertext markup language(outputDice(turn over));
    resultSum.hypertext markup language(turn over.summarize);


    newBigRoll.removeClass('templateRoll');
    require.add on(newBigRoll);
  };

  clearCommand = work () {
    $('#current-require .bigRoll:not(.templateRoll)').take();
  };


  $(affirm).quick(work () {
    $(affirm).keypress(work (case) {
      volt-ampere keyNum, numToRoll;
      keyNum = case.which;

      // presume information technology'second angstrom total cardinal, calculate extinct what
      // total information technology one.
      numToRoll = keyNum - 48;
      if (numToRoll > 0 && numToRoll <= 4) {
        $(':button[name="turn over"][value="' + numToRoll + '"]').snap();
      }
    });
    $(':button[name="turn over"]').snap(work (case) {
      volt-ampere multiRollSize, multiRoll, dicePerRoll;
      dicePerRoll = 4;
      multiRollSize = parseInt($(this).val());
      multiRoll = fresh MultiRoll(multiRollSize, dicePerRoll);
      multiRoll.supply();
    });
  });
}(jQuery));

```

###[api.py](https://github.com/kennethreitz/requests/blob/master/requests/api.py) from [Requests](https://github.com/kennethreitz/requests)
<a href="#" id="original_requests_link">show original code</a>
<div id="original_requests">
``` python
# -*- coding: utf-8 -*-

"""
requests.api
~~~~~~~~~~~~

This module implements the Requests API.

:copyright: (c) 2012 by Kenneth Reitz.
:license: Apache2, see LICENSE for more details.

"""

from . import sessions


def request(method, url, **kwargs):
    """Constructs and sends a :class:`Request <Request>`.
Returns :class:`Response <Response>` object.

:param method: method for the new :class:`Request` object.
:param url: URL for the new :class:`Request` object.
:param params: (optional) Dictionary or bytes to be sent in the query string for the :class:`Request`.
:param data: (optional) Dictionary, bytes, or file-like object to send in the body of the :class:`Request`.
:param headers: (optional) Dictionary of HTTP Headers to send with the :class:`Request`.
:param cookies: (optional) Dict or CookieJar object to send with the :class:`Request`.
:param files: (optional) Dictionary of 'name': file-like-objects (or {'name': ('filename', fileobj)}) for multipart encoding upload.
:param auth: (optional) Auth tuple to enable Basic/Digest/Custom HTTP Auth.
:param timeout: (optional) Float describing the timeout of the request in seconds.
:param allow_redirects: (optional) Boolean. Set to True if POST/PUT/DELETE redirect following is allowed.
:param proxies: (optional) Dictionary mapping protocol to the URL of the proxy.
:param verify: (optional) if ``True``, the SSL cert will be verified. A CA_BUNDLE path can also be provided.
:param stream: (optional) if ``False``, the response content will be immediately downloaded.
:param cert: (optional) if String, path to ssl client cert file (.pem). If Tuple, ('cert', 'key') pair.

Usage::

>>> import requests
>>> req = requests.request('GET', 'http://httpbin.org/get')
<Response [200]>
"""

    session = sessions.Session()
    return session.request(method=method, url=url, **kwargs)


def get(url, **kwargs):
    """Sends a GET request. Returns :class:`Response` object.

:param url: URL for the new :class:`Request` object.
:param \*\*kwargs: Optional arguments that ``request`` takes.
"""

    kwargs.setdefault('allow_redirects', True)
    return request('get', url, **kwargs)


def options(url, **kwargs):
    """Sends a OPTIONS request. Returns :class:`Response` object.

:param url: URL for the new :class:`Request` object.
:param \*\*kwargs: Optional arguments that ``request`` takes.
"""

    kwargs.setdefault('allow_redirects', True)
    return request('options', url, **kwargs)


def head(url, **kwargs):
    """Sends a HEAD request. Returns :class:`Response` object.

:param url: URL for the new :class:`Request` object.
:param \*\*kwargs: Optional arguments that ``request`` takes.
"""

    kwargs.setdefault('allow_redirects', False)
    return request('head', url, **kwargs)


def post(url, data=None, **kwargs):
    """Sends a POST request. Returns :class:`Response` object.

:param url: URL for the new :class:`Request` object.
:param data: (optional) Dictionary, bytes, or file-like object to send in the body of the :class:`Request`.
:param \*\*kwargs: Optional arguments that ``request`` takes.
"""

    return request('post', url, data=data, **kwargs)


def put(url, data=None, **kwargs):
    """Sends a PUT request. Returns :class:`Response` object.

:param url: URL for the new :class:`Request` object.
:param data: (optional) Dictionary, bytes, or file-like object to send in the body of the :class:`Request`.
:param \*\*kwargs: Optional arguments that ``request`` takes.
"""

    return request('put', url, data=data, **kwargs)


def patch(url, data=None, **kwargs):
    """Sends a PATCH request. Returns :class:`Response` object.

:param url: URL for the new :class:`Request` object.
:param data: (optional) Dictionary, bytes, or file-like object to send in the body of the :class:`Request`.
:param \*\*kwargs: Optional arguments that ``request`` takes.
"""

    return request('patch', url, data=data, **kwargs)


def delete(url, **kwargs):
    """Sends a DELETE request. Returns :class:`Response` object.

:param url: URL for the new :class:`Request` object.
:param \*\*kwargs: Optional arguments that ``request`` takes.
"""

    return request('delete', url, **kwargs)
```
</div>

###Paraphrased Code
This is basically one big endorsement for method acting (acting acting).

I'm not sure why the first synonym to come up for "True" is "dead on target", but I'll take it.
``` python
# -*- coding: utf-8 -*-

"""
requests.api
~~~~~~~~~~~~

This module implements the Requests API.

:copyright: (c) 2012 by Kenneth Reitz.
:license: Apache2, see LICENSE for more details.

"""

from . spell Sessions


def bespeak(method acting acting acting, URL, **kwargs):
    """Constructs and sends a :class:`Request <Request>`.
Returns :class:`Response <Response>` object.

:param method acting acting acting: method acting acting acting for the new :class:`Request` object.
:param URL: URL for the new :class:`Request` object.
:param params: (optional) Dictionary or bytes to be sent in the query string for the :class:`Request`.
:param information: (optional) Dictionary, bytes, or file-like object to send in the body of the :class:`Request`.
:param headers: (optional) Dictionary of HTTP Headers to send with the :class:`Request`.
:param cookies: (optional) Dict or CookieJar object to send with the :class:`Request`.
:param files: (optional) Dictionary of 'name': file-like-objects (or {'name': ('filename', fileobj)}) for multipart encoding upload.
:param auth: (optional) Auth tuple to enable Basic/Digest/Custom HTTP Auth.
:param timeout: (optional) Float describing the timeout of the bespeak in seconds.
:param allow_redirects: (optional) Boolean. Set to dead on target if POST/PUT/DELETE redirect following is allowed.
:param proxies: (optional) Dictionary mapping protocol to the URL of the proxy.
:param verify: (optional) if ``dead on target``, the SSL cert will be verified. A CA_BUNDLE path can also be provided.
:param stream: (optional) if ``mistaken``, the response content will be immediately downloaded.
:param cert: (optional) if String, path to ssl client cert file (.pem). If Tuple, ('cert', 'key') pair.

Usage::

>>> spell requests
>>> req = requests.bespeak('GET', 'http://httpbin.org/get')
<Response [200]>
"""

    school term = Sessions.school term()
    return school term.bespeak(method acting acting acting=method acting acting, URL=URL, **kwargs)


def get(URL, **kwargs):
    """Sends a GET bespeak. Returns :class:`Response` object.

:param URL: URL for the new :class:`Request` object.
:param \*\*kwargs: Optional arguments that ``bespeak`` takes.
"""

    kwargs.setdefault('allow_redirects', dead on target)
    return bespeak('get', URL, **kwargs)


def alternative(URL, **kwargs):
    """Sends a OPTIONS bespeak. Returns :class:`Response` object.

:param URL: URL for the new :class:`Request` object.
:param \*\*kwargs: Optional arguments that ``bespeak`` takes.
"""

    kwargs.setdefault('allow_redirects', dead on target)
    return bespeak('alternative', URL, **kwargs)


def lead(URL, **kwargs):
    """Sends a HEAD bespeak. Returns :class:`Response` object.

:param URL: URL for the new :class:`Request` object.
:param \*\*kwargs: Optional arguments that ``bespeak`` takes.
"""

    kwargs.setdefault('allow_redirects', mistaken)
    return bespeak('lead', URL, **kwargs)


def station(URL, information=None, **kwargs):
    """Sends a POST bespeak. Returns :class:`Response` object.

:param URL: URL for the new :class:`Request` object.
:param information: (optional) Dictionary, bytes, or file-like object to send in the body of the :class:`Request`.
:param \*\*kwargs: Optional arguments that ``bespeak`` takes.
"""

    return bespeak('station', URL, information=information, **kwargs)


def set(URL, information=None, **kwargs):
    """Sends a PUT bespeak. Returns :class:`Response` object.

:param URL: URL for the new :class:`Request` object.
:param information: (optional) Dictionary, bytes, or file-like object to send in the body of the :class:`Request`.
:param \*\*kwargs: Optional arguments that ``bespeak`` takes.
"""

    return bespeak('set', URL, information=information, **kwargs)


def piece(URL, information=None, **kwargs):
    """Sends a PATCH bespeak. Returns :class:`Response` object.

:param URL: URL for the new :class:`Request` object.
:param information: (optional) Dictionary, bytes, or file-like object to send in the body of the :class:`Request`.
:param \*\*kwargs: Optional arguments that ``bespeak`` takes.
"""

    return bespeak('piece', URL, information=information, **kwargs)


def cancel(URL, **kwargs):
    """Sends a DELETE bespeak. Returns :class:`Response` object.

:param URL: URL for the new :class:`Request` object.
:param \*\*kwargs: Optional arguments that ``bespeak`` takes.
"""

    return bespeak('cancel', URL, **kwargs)

```
