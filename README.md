<br />
<p align="center">
  <a href="https://www.microverse.org/">
  <img src="./doc/microverse.png" alt="Logo" width="80" height="80">
  </a>
</p>

<center><h1>Building Facebook</h1></center>

<center><h2>Try a live version of this project at Heroku: <a href="https://warm-thicket-07457.herokuapp.com/">https://warm-thicket-07457.herokuapp.com/</a><h2></center>

## About The Project

We built a large portion of the core Facebook user functionality in this project. There is no Javascript-heavy front end stuff but you won’t need it to get a nice user experience.

It includes some basic integration tests that checks if the page is loading properly and unit tests to make sure the associations have been properly set up.

### Built With

This progam was made using this technologies

* [Ruby on Rails](https://www.ruby-lang.org/en/)
* [Heroku](https://heroku.com/)
* [Rubocop](https://github.com/rubocop-hq/rubocop)
* [Stickler](https://stickler-ci.com/)

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisite Instalations

* Ruby
* Rails

You can easily install Ruby on your Linux computer by using [Homebrew](https://docs.brew.sh/) and [Chruby](https://github.com/postmodern/chruby)

``` sh
brew install chruby
brew install ruby-install
ruby-install ruby
```

After that make sure to install rails simply by writting `` `gem install rails` `` on the console.
Check that rails was installed by writting `` `rails -v` ` ` and you should get an output similar to ` ` `Rails 4.2.4` `` with your rails version.

### Installation

Clone this repo `` `git clone https://github.com/jairjy/Microverse-508-Facebook-Clone.git` ``
Then intall the required gems with `` `bundle install` ` ` followed by ` ` `bundle update` ``

Migrate the database to your machine with `` `rails db:migrate` ``

You can test the API in the rails console. Access it with `` `rails console` ``

## License

Distributed under the MIT License. See `LICENSE` for more information.

<!-- CONTACT -->

## Contact

* Sarah Uryelah: [Github](https://github.com/uryela), [Twitter](https://twitter.com/uryela)

* Jair Jaramillo: [Github](https://github.com/jairjy), [Twitter](https://twitter.com/jairjy)

Project Link: [Private Events](https://github.com/jairjy/Microverse-508-Facebook-Clone)

<!-- ACKNOWLEDGEMENTS -->

## Acknowledgements

* [Microverse](https://www.microverse.org/)
* [The Odin Project](https://www.theodinproject.com/)
* [Rails Guide](https://guides.rubyonrails.org)
