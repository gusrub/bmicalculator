# BMI Calculator

This is a simple application that allows users to sign up and calculate their body mass index or short for [BMI](https://en.wikipedia.org/wiki/Body_mass_index), given their weight and heigh, based on [WHO](https://en.wikipedia.org/wiki/World_Health_Organization) standards.

If you are seeing this page in the github wiki please go to the [bitbucket project page](https://bitbucket.org/gusrub/bmi-calculator) where it is really tracked and managed.

## Dependencies

This application uses the usual suspects: ruby, rails and postgres. There are no specific requirements other than running a recent version of ruby, preferably one above 2.1

## Configuration

We are using dotenv to manage settings locally and for testing, that way we can simply reference `ENV['VARIABLE']` within our code. There is an included `example.env` file that you can use as a base to modify it for your own settings. Use a `.env.development` for development and `.env.test` for testing.

## Running locally

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

Then simply run the app:

```
rails server
```

## Running with docker

If you don't want to hassle with setting a local dev environment you can just fire up a docker instance of the app:

 - Rename the included `env.example` to `.env`
 - Change the settings there. Most have defaults but the `SECRET_KEY_BASE` and `POSTMARK_API_TOKEN` must be set to something else for obvious reasons
 - Although we are using `letter_opener` for mails, that doesn't work for virtualized environments as there is no browser really within the Docker container so you'll need to use postmark or some other mailer

Once you have the settings on place simply run the following:

```
docker-compose up --build
```

The initial docker creation of the image should run the migrations automatically.

## Testing

Run:

```
rails test
```

We are using minitest with a special gem called `minitest-reporters` so it should ouput nicer messages.

That's it!