# Mastery #
### A web app for tracking time ###

## Description ##

The idea here is to track the amount of time spent doing something you want to do – whether it’s reading, or practicing an instrument or language, or developing code, or whatever. It could also conceivably be used to track “bad” habits – watching TV, etc. – in which case perhaps “Mastery” isn't the ideal name.

Additionally, I'd like to include simpler goals, which maybe aren’t the type you’d want to time, but just track doing (as in apps such as Lift).

All of this would be provided in a feed (with the option to make certain things private), with badges awarded for certain milestones (100 hours, 50 times, etc.). These things could be shared to social networks, and viewed within this network by friends and followers. Not a real attempt at creating a social network to rival any others, but the availability for positive reinforcement is always good

This is the aim. I’ve seen apps achieve some of these things, but not all together, and some (not Lift, but others) have no design sensibilities, so hopefully I can bring something on that front.

## Functionality ##

### Phase One ###

- Log in/create your account through Facebook
- Create a few activities. Activities will be public or private and will be one of two categories:
  - **Timed:** Activities that track the time spent doing them
  - **Checked:** Activities that you either did, or didn't do (perhaps sticking to *did* do, with the idea that you can do something multiple times per day)
- Begin logging those activities, every time you do them
- Share these activities on Mastery and on Facebook

*** Phase Two ***

- Metrics
- Badges
- Comments
- More complicated tracking


# To Do #

## Users ##
- Redirect current_user from users/:username path to root
- Add friendships model & infrastructure
  - Add news feed
  - Add infrastructure for comments
- Allow facebook/twitter validation, sharing

## Activities ##
- Create infrastructure of public activities and instances
- Ajaxify?
- Analytics

## Instances ##