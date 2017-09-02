# BMI Calculator

This is a simple application that allows users to sign up and calculate their body mass index or short for [BMI](https://en.wikipedia.org/wiki/Body_mass_index), given their weight and heigh, based on [WHO](https://en.wikipedia.org/wiki/World_Health_Organization) standards.

If you are seeing this page in the github wiki please go to the [bitbucket project page](https://bitbucket.org/gusrub/bmi-calculator) where it is really tracked and managed.

## Dependencies

This application uses the usual suspects: ruby, rails and postgres. There are no specific requirements other than running a recent version of ruby, preferably one above 2.1

## Configuration

We are using dotenv to manage settings locally and for testing, that way we can simply reference `ENV['VARIABLE']` within our code. There is an included `example.env` file that you can use as a base to modify it for your own settings. Use a `.env.development` for development and `.env.test` for testing.

Once you setup the env vars do the usual dance:

```
bundle install
rails db:drop db:create db:migrate
```

If you want some test data make sure you also seed the database:

```
rails db:seed
```

To create a bunch of test users and the ranges for the WHO categories.

## Testing

Run:

```
rails test
```

We are using minitest with a special gem called `minitest-reporters` so it should ouput nicer messages.

## Running

```
rails server
```

That's it!