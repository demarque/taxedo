Taxedo Regions
===============

## How to add a region

The region management is a simple YAML file. Here's an overview of each keys defining a region.
We will use quebec as an example :

```yaml
# ID of the region. When using a country use the ISO 3166-1 alpha-3
quebec:
  # Currency for the region
  currency: cad

  # Indicate whether the tax are included or not in the price
  included: false

  # These are the tax rules.
  # Most of the time it should be the standard rules but on some product there can be exeptions.
  rules:
    standard: ['gst', 'qst']
    books: ['gst']

  taxes:
    # ID of the tax
    gst:
      # The value represent the rate of the tax and the key the beginning of the application. 7.25% = 725
      19910101: 700
      20060701: 600
      20080101: 500
    qst:
      19940513: 650
      19980101: 750
      20110101: 850
      20120101: 950
```

## Currently Supported Regions

* Canada
* Canada : Quebec
