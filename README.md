Sublime Text Overlay
====================

[![Build Status](https://travis-ci.org/DamnWidget/sublime-text.png)](https://travis-ci.org/DamnWidget/sublime-text)

Sublime Text overlay is a collection of ebuilds to install Sublime Text 2 or Sublime Text 3 in slots and select one using eselect script on Gentoo or Gentoo based distributions that support portage.


Setup
-----

Install layman in your ditribution is you don't installed it already and then execute:

    sudo layman -a sublime-text

If you don't know what layman is or you are not sure about how to install it, you can install this overlay using the installation script @install.sh provided in the same package using `wget`.


The install.sh Script
---------------------

		wget --no-check-certificate https://raw.github.com/DamnWidget/sublime-text/master/install.sh -O - | sudo sh


Overlays
--------

1. app-admin/eselect-sublime
2. app-editor/sublime-text


Is this overlay supported by Gentoo?
------------------------------------

Yes, since May 2013 this overlay is officialy included in the Gentoo layman overlays list.


Where can I send feedbacks?
----------------------------

Use this repository issues system
