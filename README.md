Satistrano - Capistrano-ready Satis Package Repository Generator
====================================

Satistrano builds on top of [Satis](https://github.com/composer/satis) to make it a little easier to test locally and deploy.

The project includes basic Capistrano configuration extending the Capifony recipies.

Usage
-----

- Download [Composer](https://getcomposer.org/download/): `curl -sS https://getcomposer.org/installer | php`
- Install satistrano: `git clone https://github.com/stevelacey/satistrano.git satis`
- Build a repository: `php bin/satis build app/config/repository.json web`
- Install Capistrano: `gem install capistrano`
- Install Capifony: `gem install capifony`
- Configure: `app/config/deploy.rb` and `app/config/repository.json` (examples provided)
- Deploy: `cap deploy`

Find more information in the relevent documentation:

Satis: https://github.com/composer/satis<br />
Capistrano: https://github.com/capistrano/capistrano<br />
Capifony: http://capifony.org

Updating
--------

Updating is as simple as running `git pull && php composer.phar install` in the satis directory.

Make sure you merge in any changes from [composer/satis](https://github.com/composer/satis) and pull request me to do the same.

Requirements
------------

PHP 5.3+

Authors
-------

Steve Lacey - <steve@stevelacey.net> - <http://twitter.com/stevelacey> - <http://stevelacey.net><br />

See also the list of [Satis contributors](https://github.com/composer/satis/contributors) for those who participated in the Satis project.

License
-------

Satistrano is licensed under the MIT License - see the LICENSE file for details
