Sulime Text Overlay
===================

Sublime Text overlay is a collection of ebuilds to install Sublime Text 2 or Sublime Text 3 in slots and select one using eselect script on Gentoo or Gentoo based distributions that support portage.


Setup
-----

The easier way to install this overlay is using through the installation script @install.sh provided in the same package using `wget`.


The install.sh Script
---------------------

		wget --no-check-certificate https://raw.github.com/DamnWidget/sublime-text/master/install.sh -O - | sh


Manual Way
----------

To install sublime-text overlay you need to donwload the overlay definition file `sublime-text.xml` and add it to your `layman.cfg` file or add it in your `/etc/layman/overlays` directory. Then you have to add the overlay to your layman local overlays and syncronize your emerge | eix caches.


Overlays
--------

1. app-admin/eselect-sublinme
2. app-editor/sublime-text


Is this overlay supported by Gentoo?
------------------------------------

Not yet


Wheere can I send feedbacks?
----------------------------

Use this repository issues system
