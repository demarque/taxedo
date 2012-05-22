Taxedo [![Build Status](https://secure.travis-ci.org/demarque/taxedo.png?branch=master)](http://travis-ci.org/demarque/taxedo)
===============

Taxedo is a small tool to easily calculate sales tax for different regions.
It also provide helper methods to generate html, text or json reports.

Install
-------

```
gem install taxedo
```

### Rails 3

In your Gemfile:

```ruby
gem 'taxedo'
```

Usage
-----

```ruby
Taxedo.tax_for 'quebec', 1000
```

### Rails 3

Taxedo gives you access to a helper method `tax_for` in the controller and in the views.
This is the same thing as calling `Taxedo.tax_for`.

```ruby
tax_for 'quebec', 1000, format: :html
```

### Parameters

* **region**: Region of the tax. *See [regions documentation](https://github.com/demarque/taxedo/blob/master/data/README.md)*.
* **amount**: Amount in cents.
* **options**: Set of options. *See below*.

### Options

* **format**: Format of the output ( _hash, html, json, **text**_ ).
* **on**: Date parameter. Taxedo should use tax rate active for a particular date.
* **html_options**: hash of options for the html output
  * **format**: Format of the output ( _lines, rows, **table**_ ).
  * **columns**: Number of colspan in the row. Only available with the ouput **rows**.
  * **custom_content**: Content of the first column. Only availabie with the output **rows**.


Copyright
---------

Copyright (c) 2012 De Marque inc. See LICENSE for further details.
