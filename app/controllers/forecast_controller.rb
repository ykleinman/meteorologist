require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("forecast/coords_to_weather_form.html.erb")
  end

  def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================

    url = "https://api.darksky.net/forecast/a69021676788c845c86c0cf3984a5926/37.8267,-122.4233"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    currently = parsed_data["currently"]
    minutely = parsed_data["minutely"]
    summary_of_next_sixty_minutes = minutely["summary"]
    hourly = parsed_data["hourly"]
    summary_of_next_several_days = minutely["summary"]

    @current_temperature =  temperature = currently["temperature"]

    @current_summary = summary = currently["summary"]

    @summary_of_next_sixty_minutes = "Replace this string with your answer."

    @summary_of_next_several_hours = "Replace this string with your answer."

    @summary_of_next_several_days = "Replace this string with your answer."

    render("forecast/coords_to_weather.html.erb")
  end
end
