---
layout: post
title: "An Attempt at Science"
date: 2014-03-23 17:21:08 -0400
comments: true
categories: [code, data]
---

Last Saturday I spent the afternoon messing around with some open data sets using IPython notebook and pandas.  

<!--more-->

The first data set came from the city of Toronto's open data [portal](http://www1.toronto.ca/wps/portal/contentonly?vgnextoid=9e56e03bb8d1e310VgnVCM10000071d60f89RCRD), and contained records of all the official heat warnings released by the city since 2001.  The second data set contained atmospheric pressure readings from smart phones throughout the city of Toronto.  I got this data through the developer API for [pressureNET](http://pressurenet.io/), a Toronto-based startup run by my friend [Jacob](http://jacobsheehy.com/) and [some](http://philippejones.com/) [other](http://jaredkerim.com/) cool guys.  Knowing that atmospheric pressure and temperature are somehow related, I formed the hypothesis that there would be a correlation between the pressure readings and the occurrence of heat warnings.  

This [IPython notebook](http://nbviewer.ipython.org/gist/anonymous/137e0bd2a813decb1bfc) shows how I went about testing my hypothesis.
