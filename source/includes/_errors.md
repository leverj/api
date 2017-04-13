# Errors

<aside class="notice">Always check error codes of HTTP requests. Do not assume success.</aside>

## The Coinpit API uses the standard HTTP error codes:

Error Code | Meaning
---------- | -------
400 | Bad Request -- Usually syntax error in your HTTP request URI or headers
401 | Unauthorized -- You are using an unregistered private key or your clock in way off
404 | Not Found -- The specified resource could not be found
405 | Method Not Allowed -- Resource does not support that method. Eg. PUT on a GET only resource
406 | Not Acceptable -- You requested a format that isn't JSON
410 | Gone -- Resource no longer supported
429 | Too Many Requests -- You have exceed the rate limit
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.
