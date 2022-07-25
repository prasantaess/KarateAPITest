Feature: validate complex Json

  Scenario: complex Json
    * def ComplexJson =
      """
      {
      	"id": "0001",
      	"type": "donut",
      	"name": "Cake",
      	"ppu": 0.55,
      	"batters":
      		{
      			"batter":
      				[
      					{ "id": "1001", "type": "Regular" },
      					{ "id": "1002", "type": "Chocolate" },
      					{ "id": "1003", "type": "Blueberry" },
      					{ "id": "1004", "type": "Devil's Food" }
      				]
      		},
      	"topping":
      		[
      			{ "id": "5001", "type": "None" },
      			{ "id": "5002", "type": "Glazed" },
      			{ "id": "5005", "type": "Sugar" },
      			{ "id": "5007", "type": "Powdered Sugar" },
      			{ "id": "5006", "type": "Chocolate with Sprinkles" },
      			{ "id": "5003", "type": "Chocolate" },
      			{ "id": "5004", "type": "Maple" }
      		]
      }
      """
    * print ComplexJson
    * def id = ComplexJson.id
    * print id
    * def batters = ComplexJson.batters
    * print batters
    * def batter = ComplexJson.batters.batter
    * print batter
    * def batterId = ComplexJson.batters.batter[0].id
    * print batterId
    * print ComplexJson.batters.batter[0].id
    * print ComplexJson.batters.batter[0].type
    * print ComplexJson.batters.batter[3].id
    * print ComplexJson.batters.batter[3].type
    * print ComplexJson.topping[0].id
    * print ComplexJson.topping[0].type
    * print ComplexJson.topping[6].id
    * print ComplexJson.topping[6].type

  Scenario: Complex Json 2
    * def ComplexJson2 =
      """
      {
      "id": "0001",
      "type": "donut",
      "name": "Cake",
      "image":
      	{
      		"url": "images/0001.jpg",
      		"width": 200,
      		"height": 300
      	},
      "thumbnail":
      	{
      		"url": "images/thumbnails/0001.jpg",
      		"width": 32,
      		"height": 32
      	}
      }
      """
    * print ComplexJson2
    * print ComplexJson2.id
    * print ComplexJson2.type
    * print ComplexJson2.name
    * print ComplexJson2.image
    * print ComplexJson2.image.url
    * print ComplexJson2.image.width
    * print ComplexJson2.image.height
    * print ComplexJson2.thumbnail
    * print ComplexJson2.thumbnail.url
    * print ComplexJson2.thumbnail.width
    * print ComplexJson2.thumbnail.height

  Scenario: Complex Json 2
    * def ComplexJson3 =
      """
      {
      "medications": [
        {
          "aceInhibitors": [
            {
              "name": "lisinopril",
              "strength": "10 mg Tab",
              "dose": "1 tab",
              "route": "PO",
              "sig": "daily",
              "pillCount": "#90",
              "refills": "Refill 3"
            }
          ]
        }
      ],
      "labs": [
        {
          "name": "Arterial Blood Gas",
          "time": "Today",
          "location": "Main Hospital Lab"
        }
      ],
      "imaging": [
        {
          "name": "Chest X-Ray",
          "time": "Today",
          "location": "Main Hospital Radiology"
        }
      ]
      }
      """
    * print ComplexJson3
    * print ComplexJson3.medications
    * print ComplexJson3.medications[0].aceInhibitors
    * print ComplexJson3.labs
    * print ComplexJson3.labs[0].location
    * print ComplexJson3.imaging
    * print ComplexJson3.imaging[0].time

  Scenario: Complex Json 4
    * def ComplexJson4 =
      """
      [
      {
      "Sample":"StringValue", 
      "Id": 1
      },
      {
      "Sample":"StringValue2", 
      "Id": 2
      },
      {
      "Sample":"StringValue3", 
      "Id": 3
      }
      ]
      """
    * print ComplexJson4
    * print ComplexJson4[0].Sample
    * print ComplexJson4[0].Id

  Scenario: Validate Weather Data
    * def WeatherJson =
      """
      {
        "location": {
          "name": "London",
          "region": "City of London, Greater London",
          "country": "United Kingdom",
          "lat": 51.52,
          "lon": -0.11,
          "tz_id": "Europe/London",
          "localtime_epoch": 1613896955,
          "localtime": "2021-02-21 8:42"
        },
        "current": {
          "last_updated_epoch": 1613896210,
          "last_updated": "2021-02-21 08:30",
          "temp_c": 11,
          "temp_f": 51.8,
          "is_day": 1,
          "condition": {
            "text": "Partly cloudy",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
            "code": 1003
          },
          "wind_mph": 3.8,
          "wind_kph": 6.1,
          "wind_degree": 220,
          "wind_dir": "SW",
          "pressure_mb": 1009,
          "pressure_in": 30.3,
          "precip_mm": 0.1,
          "precip_in": 0,
          "humidity": 82,
          "cloud": 75,
          "feelslike_c": 9.5,
          "feelslike_f": 49.2,
          "vis_km": 10,
          "vis_miles": 6,
          "uv": 1,
          "gust_mph": 10.5,
          "gust_kph": 16.9,
          "air_quality": {
            "co": 230.3,
            "no2": 13.5,
            "o3": 54.3,
            "so2": 7.9,
            "pm2_5": 8.6,
            "pm10": 11.3,
            "us-epa-index": 1,
            "gb-defra-index": 1
          }
        }
      }

      """
    * print WeatherJson
    * print WeatherJson.location
    * print WeatherJson.location.name
    * print WeatherJson.current
    * print WeatherJson.current.last_updated
    * print WeatherJson.current.condition
    * print WeatherJson.current.condition.text
    * print WeatherJson.current.wind_kph
    * print WeatherJson.current.air_quality
    * print WeatherJson.current.air_quality.co
    Then match WeatherJson.current.air_quality.co == 230.3
