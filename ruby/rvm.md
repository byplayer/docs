# install #

    bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )

# upgrading #

    bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-latest )

# post installing #

add follow into .zshrc

   if [[ -s "$HOME/.rvm/scripts/rvm" ]]  ; then source "$HOME/.rvm/scripts/rvm" ; fi

## Getting started ##

First Install RVM

Set your default ruby.

Then open a new shell and start using RVM!

    rvm install 1.9.1 ; rvm 1.9.1

    ruby -v

    > ruby 1.9.1p243 (2009-07-16 revision 24175) [x86_64-linux]

    which ruby

    > /home/wayne/.rvm/ruby-1.9.1-p243/bin/ruby

Reverting to system default is simple as well!

    rvm system

    ruby -v

    > ruby 1.8.7 (2008-08-11 patchlevel 72) [universal-darwin10.0]

    which ruby

    > /usr/bin/ruby

← See more details on the rest of the site, especially checkout the Examples .

# installed list #

    rvm list

# install ruby #

    # Installs 1.9.1
    rvm install 1.9.1

    # Installs 1.8.7
    rvm install 1.8.7

# Rubinius #

    rvm install rbx

# JRuby #

    rvm install jruby

# Ruby Enterprise Edition (REE) #

    rvm install ree

# named gem set #
## Example: testing gems ##

testing gemset

    rvm 1.9.2-head@testing

## Example: Rails versions & upgrading apps ##

    rvm 1.9.2-head
    gem install rails -v 2.3.3

    rvm gemset create rails222 rails126
    > Gemset 'rails222' created.
    > Gemset 'rails126' created.

    rvm 1.9.2-head@rails222
    gem install rails -v 2.2.2

    rvm 1.9.2-head@rails126
    gem install rails -v 1.2.6

    rvm 1.8.7
    gem install rails -v 1.2.3

## using ##

Before you can use a gemset you must first create it.

    rvm 1.9.2-head
    rvm gemset create albinochipmunk

To use a gem set

    rvm gemset use albinochipmunk

Alternatively we can switch to a gemset when we use a ruby by appending @gemsetname to the end of the ruby selector string:

    rvm use 1.9.2-head@albinochipmunk

To use a named gem set with an RVM 'do' action, append it to the ruby selector string using a '@'

    rvm 1.9.2-head@albinochipmunk,ree@albinochipmunk,jruby@albinochipmunk rake test

If you are aware of where you are at and wish to fix the gemset you can do:

    rvm gemset albinochipmunk
    rvm 1.9.2-head,ree,jruby rake --sticky test

If you would like gemsets to be automatically created when used you can export a flag in your ~/.rvmrc file:

    rvm_gemset_create_on_use_flag=1

## listing ##
To list the name of the currently selected gem set

    rvm gemset albinochipmunk
    rvm gemset name

    > albinochipmunk

To list the full directory path for the currently selected gemset:

     rvm gemdir
     > /Users/wayne/.rvm/gems/1.9.2-head@albinochipmunk

To list all named gem sets for current selected ruby interpreter

    rvm gemset list

    > global
    > albinochipmunk

## Deleting gemset ##
You can delete a gem set, this will prompt you if you are sure you wish to delete the gemset.

    rvm gemset albinochipmunk
    rvm gemset delete albinochipmunk

If you wish to not be prompted, pass --force:

    rvm gemset albinochipmunk
    rvm --force gemset delete albinochipmunk"

## Emptying Gemsets ##

You can empty a gem set, this will prompt you if you are sure you wish to empty the gemset. This removes all gems installed to the gemset.

    rvm gemset use albinochipmunk
    rvm gemset empty albinochipmunk

If you wish to not be prompted, pass --force:

    rvm gemset use albinochipmunk
    rvm --force gemset empty albinochipmunk

## Exporting Gemsets ##
Managing gem sets

We can not only use completely separate gem sets per application/project/etc... we can also export and load them easily.

To export a gem set easily, assuming a project called 'albinochipmunk' running on Ruby 1.9.1:

    rvm 1.9.1@albinochipmunk gemset export

will create an 'albinochipmunk.gems' file.

Alternatively, if you already have a ruby selected

    rvm gemset export

will create a 'default.gems' file.

You can specify the gemset filename prefix also

    rvm gemset export albinochipmunk.gems

A subtle difference with the above command is to leave off the '.gems' which will export the gems for the gemset named 'mygemsetname'

    rvm gemset export albinochipmunk

## Importing Gemsets ##
Importing a gem set

To Import a gemset file called 'albinochipmunk.gems' to the albinochipmunk gemset of 1.9.2-head do

    rvm --create 1.9.2-head@albinochipmunk # The --create creates the gemset if it does not exist
    rvm gemset import albinochipmunk

Note that you can use any gem set name to import into.

You can specify the gemset filename prefix also

    rvm gemset albinochipmunk
    rvm gemset import albinochipmunk

Alternatively, if you already have a ruby and/or gemset selected:

    rvm 1.9.2-head@albinochipmunk
    rvm gemset import

Importing without arguments will check for gemset files in the following order:

A gemset file with the current gem set name prefix in the current directory
RVM then checks for 'default.gems' in the current directory
Next RVM looks for a 'system.gems' in the current directory.
Finally RVM looks for a '.gems' file in the current directory
You might also be interested in Copying gemsets from one rvm ruby[@gemset] to another.

## Copying Gemsets ##
You can also copy a gemset from one ruby to another.

    rvm gemset copy 1.8.7@rails3 1.9.2-head@rails3

This does not require gemsets.

    rvm gemset copy 1.8.7 1.9.2-head


